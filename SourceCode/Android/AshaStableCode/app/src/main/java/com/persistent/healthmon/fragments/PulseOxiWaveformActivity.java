package com.persistent.healthmon.fragments;

import android.support.v7.app.AppCompatActivity;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

import org.achartengine.ChartFactory;
import org.achartengine.GraphicalView;
import org.achartengine.chart.PointStyle;
import org.achartengine.model.XYMultipleSeriesDataset;
import org.achartengine.model.XYSeries;
import org.achartengine.renderer.XYMultipleSeriesRenderer;
import org.achartengine.renderer.XYSeriesRenderer;

import com.persistent.healthmon.util.HealthMonLog;
import com.vesag.bt.util.bt_util_Constants;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.widget.ProgressBar;

public class PulseOxiWaveformActivity extends AppCompatActivity {
    private XYSeries xySeries;
    private XYMultipleSeriesDataset dataset;
    private XYMultipleSeriesRenderer renderer;
    private XYSeriesRenderer rendererSeries;
    private GraphicalView view;
    //private double samplingRate = 0.6;
    //Sampling freq for PulseOxi signal is 10Hz. So the sampling rate is 0.1seconds
    private double samplingRate = /*6.7;//ms */ 0.1; //seconds

    private int yMax = 140;
    private int yMin = 0;
    private double currentX = 0;
    private final int chartDelay = 10; //  millisecond delay for count
    private ChartingThread chartingThread;

    // TODO: package visibility so that queue service can see when it is ready for data
    static boolean isActive = false;
    LinkedBlockingQueue<Double> queue = new LinkedBlockingQueue<Double>();
    //    LinkedBlockingQueue<Integer> queue = new LinkedBlockingQueue<Integer>();
    ProgressBar progressBar = null;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        progressBar = new ProgressBar(this);
        progressBar.setVisibility(View.VISIBLE);
        setContentView(progressBar);
        readPulseOxiWavepoints();
        setChartLook();
        dataset = new XYMultipleSeriesDataset();
        xySeries = new XYSeries(renderer.getChartTitle());
        dataset.addSeries(xySeries);
        view = ChartFactory.getLineChartView(this, dataset, renderer);
        view.refreshDrawableState();
        currentX = 0; // reset the horizontal of the graphing

        setContentView(view);

        // To deal with onCreate coming from orientation change, only create chartingThread first time
        if (chartingThread == null) {
            ChartHandler chartUIHandler = new ChartHandler();
            chartingThread = new ChartingThread(chartUIHandler);
            chartingThread.start();
        }
        isActive = true;

    }

    private void readPulseOxiWavepoints() {
        ArrayList<Integer> pulseOxiWavePoints = getIntent().getIntegerArrayListExtra(bt_util_Constants.PULSE_OXI_WAVEPOINTS);

        if(pulseOxiWavePoints != null)
        {
            Iterator<Integer> wavepointIterator = pulseOxiWavePoints.iterator();
            while (wavepointIterator.hasNext()) {
                Double val = Double.valueOf(wavepointIterator.next());
//	    		Integer val = wavepointIterator.next();
                //  		val = (val-2048)*3/416;
                queue.offer(val);
            }
        }

    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

    class ChartHandler extends Handler {
        @Override
        public void handleMessage(Message msg) {
            double yVal = ((double)msg.arg1)/1000;
           // HealthMonLog.d("PulseOxiWaveformActivity", "x " + currentX + " y " + yVal);
            xySeries.add(currentX, yVal);
            view.repaint();
        }
    }

    public void setChartLook() {
        renderer = new XYMultipleSeriesRenderer();
        renderer.setApplyBackgroundColor(true);
        renderer.setBackgroundColor(Color.DKGRAY);//argb(100, 50, 50, 50));
        renderer.setLabelsTextSize(20);
        renderer.setLegendTextSize(20);
        renderer.setAxesColor(Color.BLACK);
        renderer.setAxisTitleTextSize(20);
        renderer.setChartTitle("Pulse Oximeter Waveform");
        renderer.setChartTitleTextSize(30);
        renderer.setFitLegend(true);
        renderer.setGridColor(Color.BLACK);

        renderer.setPanEnabled(true, false); // TODO
        renderer.setXAxisMin(0);
        renderer.setXAxisMax(20);
        renderer.setPanLimits(new double[]{0,31,0,140});
        renderer.setPointSize(0.5f);
        renderer.setXTitle("X (s)");
        renderer.setYTitle("Y (mV)");
        renderer.setMargins(new int []{40, 40, 80, 60}); // TODO: i doubled
        renderer.setZoomButtonsVisible(false);
        renderer.setZoomEnabled(false);
        renderer.setShowGrid(true);
        renderer.setYAxisMax(yMax);
        renderer.setYAxisMin(yMin);
        renderer.setShowLabels(true);
        renderer.setShowLegend(true);

        renderer.setExternalZoomEnabled(false);
        renderer.setZoomEnabled(false, false);

        rendererSeries = new XYSeriesRenderer();
        rendererSeries.setColor(Color.GREEN);
        rendererSeries.setLineWidth(1f);
        rendererSeries.setPointStyle(PointStyle.CIRCLE);
        renderer.addSeriesRenderer(rendererSeries);
    }

    class ChartingThread extends Thread {
        private boolean continueCharting = true;
        private Handler handler;
        public ChartingThread(Handler handler) {
            this.handler = handler;
        }

        @Override
        public void run() {
            while (!queue.isEmpty()) {
                Double yVal = null;
                //		Integer yVal = null;
                try {
                    Thread.sleep(chartDelay);
                    yVal = queue.poll(2, TimeUnit.SECONDS);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (yVal == null) {
                    // continue;
                }
                currentX = currentX + samplingRate;
                if (yVal > yMax) {
                    yMax = yVal.intValue();
                    renderer.setYAxisMax(yVal);
                } else if (yVal < yMin) {
                    yMin = yVal.intValue();
                    renderer.setYAxisMin(yVal);
                }

                // send Message to UI handler for charting.
                Message msg = Message.obtain();
                msg.arg1 = (int) Math.round(yVal * 1000);
                handler.sendMessage(msg);
            }
        }

        public void cancel() {
            continueCharting = false;
        }
    }
}
