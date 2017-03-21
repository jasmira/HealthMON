package com.persistent.healthmon.fragments;

import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.MediaController;
import android.widget.Toast;
import android.widget.VideoView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.util.HealthMonUtility;

/**
 * Created by harshal_patil on 5/19/2016.
 */
public class VideoFragment extends BaseFragment implements MediaPlayer.OnCompletionListener,
        MediaPlayer.OnPreparedListener, MediaPlayer.OnErrorListener {

    private MediaStore.Video mVideo;
    private VideoView mVideoView;
    // The video position
    private int mPosition;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View fragmentView = inflater.inflate(R.layout.educationvideo_popup, container, false);

        mVideoView = (VideoView) fragmentView.findViewById(R.id.VideoView);
        fragmentView.setFocusableInTouchMode(true);
        fragmentView.requestFocus();

        fragmentView.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                        getFragmentManager().popBackStack();
                        return true;
                    }
                }
                return false;
            }
        });
        return fragmentView;
    }


    @Override
    public void onPause() {
        super.onPause();

        // Pause the video if it is playing
        if (mVideoView.isPlaying()) {
            mVideoView.pause();
        }

        // Save the current video position
        mPosition = mVideoView.getCurrentPosition();
    }

    @Override
    public void onResume() {
        super.onResume();

        mVideoView.setOnCompletionListener(this);
        mVideoView.setOnPreparedListener(this);
        mVideoView.setOnErrorListener(this);
        mVideoView.setKeepScreenOn(true);

        Uri uri = Uri.parse("android.resource://" + getActivity().getPackageName() + "/" +R.raw.test1);

        //Uri uri = Uri.parse(uriPath);
        mVideoView.setVideoURI(uri);
        MediaController mediaController = new MediaController(getActivity());
        mediaController.setAnchorView(mVideoView);
        mVideoView.setMediaController(mediaController);
        mVideoView.requestFocus();
        //mVideoView.start();
        if (mVideoView != null) {
            // Restore the video position
            mVideoView.seekTo(mPosition);
            mVideoView.requestFocus();
        }
        getView().setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {

                if (event.getAction() == KeyEvent.ACTION_UP && keyCode == KeyEvent.KEYCODE_BACK){
                    Toast.makeText(getActivity(),"Hello", Toast.LENGTH_SHORT).show();
                    HealthMonUtility.replaceFragment(getActivity(), new EducationFragment());

                    return true;

                }

                return false;
            }
        });
    }
    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        getView().setFocusableInTouchMode(true);
        getView().requestFocus();
        getView().setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_UP && keyCode == KeyEvent.KEYCODE_BACK) {
                    Log.e("gif--","fragment back key is clicked");
                    Toast.makeText(getActivity(),"Hello", Toast.LENGTH_SHORT).show();

                    getFragmentManager().popBackStack();

                    return true;
                }
                return false;
            }
        });
    }
    @Override
    public void onDestroy() {
        super.onDestroy();

        // Clean-up
        if (mVideoView != null) {
            mVideoView.stopPlayback();
            mVideoView = null;
        }
    }

    @Override
    public void onCompletion(MediaPlayer mediaPlayer) {
        Log.e("VIDEO PLAY", "end video play");
    }

    @Override
    public void onPrepared(MediaPlayer mediaPlayer) {
        // Start the video view
        mediaPlayer.start();
        Log.e("VIDEO PLAY", "video ready for playback");
    }

    @Override
    public boolean onError(MediaPlayer mediaPlayer, int i, int i1) {
        Log.e("VIDEO PLAY", "error: " + i);
        return true;
    }

}