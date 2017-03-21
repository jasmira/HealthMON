package com.persistent.healthmon.fragments;

import android.app.Dialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.interfaces.AllPatientTaskTabChange;
import com.persistent.healthmon.interfaces.IndividualPatientOptionLoad;
import com.persistent.healthmon.interfaces.OnResult;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.model.Referal;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

/**
 * Created by pushkar_bhadle on 5/12/2016.
 */
public class AllPatientVitalFragment extends BaseFragment implements View.OnClickListener, OnResult {
    private static String TAG = AllPatientVitalFragment.class.getCanonicalName();

    AllPatientTaskTabChange allPatientTaskTabChange;

    private EditText txtTemperature, txtGirth;
    private EditText txtHeight, txtBMI;
    private EditText txtWeight, txtFundal;
    private Button vitalSave, vitalCancel;
    private TextView tv_due, tv_ltRcrd;
    String value;
    RelativeLayout rlTabContainer;
    IndividualPatientOptionLoad individualPatientOptionLoad;

    public AllPatientVitalFragment() {
    }

    public AllPatientVitalFragment(IndividualPatientOptionLoad individualPatientOptionLoad) {
        this.individualPatientOptionLoad = individualPatientOptionLoad;
    }


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.all_patient_task_vital, container, false);
        value = getArguments().getString(Constants.SELECTED_PATIENT_ID);
        HealthMonLog.i(TAG, "Patient ID = " + value);
        initView(view);
        ArrayList<PatientVitals> patientVitals = new ArrayList<>();
        patientVitals = DatabaseHelper.getInstance(getActivity()).getAllPatientVital(value);
        Collections.sort(patientVitals);
        HealthMonLog.i(TAG, "Sorted patient list => " + patientVitals.toString());
        if (patientVitals.size() > 0) {
            Date date = patientVitals.get(0).getHM_timestamp_in_DATE();
            String strDate = new SimpleDateFormat(Constants.DbConstants.UI_DATE_FORMAT_VITALS_STRING).format(date);
            tv_ltRcrd.setText(strDate);
        }

        txtHeight.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                String strht = txtHeight.getText().toString();
                String strwt = txtWeight.getText().toString();
                if (!strht.matches("[0-9.]*") || strht.equals("")) {
                    txtHeight.requestFocus();
                } else if (!strwt.matches("[0-9.]*") || strwt.equals("")) {
                    txtWeight.requestFocus();
                } else {
                    Double ht = Double.parseDouble(strht);
                    Double wt = Double.parseDouble(strwt);
                    Double bmi = wt / ((ht * 0.01) * (ht * 0.01));
                    HealthMonLog.i(TAG, " BMI = " + bmi + " HT = " + (ht * 0.01) + " WT = " + wt);
                    txtBMI.setText(String.valueOf(bmi));
                }
            }
        });

/*        txtTemperature.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                String strHB = txtTemperature.getText().toString();
                if(strHB.matches("[0-9.]*") || strHB.equals("")) {
                    if (Double.parseDouble(s.toString()) > 99 || Double.parseDouble(s.toString()) < 97.8) {
                        txtTemperature.setTextColor(getResources().getColor(R.color.colorred));
                    }
                }
            }
        });

        txtBMI.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                String strHB = txtBMI.getText().toString();
                if(strHB.matches("[0-9.]*") || !strHB.equals("")) {
                    if (Double.parseDouble(s.toString()) > 25 ) {
                        txtBMI.setTextColor(getResources().getColor(R.color.colorred));
                    }
                }
            }
        });

        txtWeight.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                String strHB = txtWeight.getText().toString();
                if(strHB.matches("[0-9.]*") || strHB.equals("")) {
                    if (Double.parseDouble(s.toString()) > 15 || Double.parseDouble(s.toString()) <=7) {
                        txtWeight.setTextColor(getResources().getColor(R.color.colorred));
                    }
                }
            }
        });*/
        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                        IndividualPatientTaskFragment individualPatientTaskFragment = new IndividualPatientTaskFragment();
                        Bundle args = new Bundle();
                        args.putString(Constants.SELECTED_PATIENT_ID, value);
                        individualPatientTaskFragment.setArguments(args);
                        HealthMonUtility.replaceFragment(getActivity(), individualPatientTaskFragment);

                        //HealthMonUtility.replaceFragment(getActivity(), individualPatientTaskFragment, R.id.rlTabOptionContainer);;
                        //getFragmentManager().popBackStack();
                        return true;
                    }

                }
                return false;
            }
        });
        return view;
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btnHelp) {
            Toast.makeText(getContext(), "Coming soon", Toast.LENGTH_SHORT).show();
        }
        if (v.getId() == R.id.btVitalsave) {
            performSave();
        }
        if (v.getId() == R.id.btnVitalcancel) {
            vitalCancelDialog(AllPatientVitalFragment.this, individualPatientOptionLoad);
        }
    }

    public void performSave() {


        final PatientVitals patientVitals = new PatientVitals();
        boolean valid = true;
        boolean isUnderWeight = false;
        boolean isOverWeight = false;
        //find out not text
        String strtemp = txtTemperature.getText().toString();
        String strht = txtHeight.getText().toString();
        String strwt = txtWeight.getText().toString();
        String strgth = txtGirth.getText().toString();
        String strFundal = txtFundal.getText().toString();
        if (!strtemp.matches("[0-9.]*") || strtemp.equals("")) {
            valid = false;
            txtTemperature.requestFocus();
        } else if (!strht.matches("[0-9.]*") || strht.equals("")) {
            valid = false;
            txtHeight.requestFocus();
        } else if (!strwt.matches("[0-9.]*") || strwt.equals("")) {
            valid = false;
            txtWeight.requestFocus();
        } else if (!strgth.matches("[0-9.]*") || strgth.equals("")) {
            valid = false;
            txtGirth.requestFocus();
        } else if (!strFundal.matches("[0-9.]*") || strFundal.equals("")) {
            valid = false;
            txtFundal.requestFocus();
        } else {
            Double temp = Double.parseDouble(strtemp);
            Double ht = Double.parseDouble(strht);
            Double wt = Double.parseDouble(strwt);
            Double gth = Double.parseDouble(strgth);
            //Double bmi = Double.parseDouble(strBMI);
            Double bmi = wt / ((ht * 0.01) * (ht * 0.01));
            Double fun = Double.parseDouble(strFundal);
            if (wt < 45) {
                isUnderWeight = true;
            } else if (wt > 100) {
                isOverWeight = true;
            }

            if (temp < 10 || temp > 150) {
                valid = false;
                txtTemperature.requestFocus();
            } else if (ht < 10 || ht > 255) {
                valid = false;
                txtHeight.requestFocus();
            } else if (wt < 25 || wt > 200) {
                valid = false;
                txtWeight.requestFocus();
            } else if (gth < 100 || gth > 1500) {
                valid = false;
                txtGirth.requestFocus();
            } else if (fun < 10 || fun > 255) {
                valid = false;
                txtFundal.requestFocus();
            } else {
                patientVitals.setTemperature(temp);
                patientVitals.setHeight(ht);
                patientVitals.setWeight(wt);
                patientVitals.setGirth(gth);
                patientVitals.setBmi(bmi);
                patientVitals.setFundalHeight(fun);
                patientVitals.setPatient_id(value);
                patientVitals.setHM_timestamp(new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).format(new Date()));
                patientVitals.setHM_timestamp_in_DATE(new Date());
                patientVitals.setHM_userId(PreferanceManager.getAshaId(getContext()));

                HealthMonLog.i(TAG, "Readings = " + temp + "   " + ht + "    " + wt + "     " + gth + "   " + bmi + "    " + fun + "      " + value);
                HealthMonLog.i(TAG, "Readings = " + patientVitals.toString());
            }

        }
        if (valid) {
            final Dialog dialog = new Dialog(getContext());
            dialog.setContentView(R.layout.dialog_dataloss_patient_registration);
            Button btnOk = (Button) dialog.findViewById(R.id.btnOk);
            Button btnCancel = (Button) dialog.findViewById(R.id.btnCancel);
            TextView tvErrMsg = (TextView) dialog.findViewById(R.id.txtErrorMsg);
            tvErrMsg.setText(getString(R.string.txtSaveData));
            btnCancel.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    dialog.dismiss();
                    return;
                }
            });
            final boolean finalIsUnderWeight = isUnderWeight;
            final boolean finalIsOverWeight = isOverWeight;
            btnOk.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    int flagWeight = Constants.PRIORITY_NORMAL_PATIENT;
                    dialog.dismiss();
                    DatabaseHelper.getInstance(getActivity()).addPatientVital(patientVitals);
                    if (finalIsUnderWeight) {
                        referToDoc("5",getActivity().getResources().getString(R.string.txtPatientUnderWeight));
                        flagWeight = Constants.PRIORITY_HIGH_RISK_PATIENT;
                        //Toast.makeText(getContext(),getString(R.string.txtPatientUnderWeight),Toast.LENGTH_SHORT).show();
                    } else if (finalIsOverWeight) {
                        referToDoc("6" ,getActivity().getResources().getString(R.string.txtPatientOverweight));
                        flagWeight = Constants.PRIORITY_HIGH_RISK_PATIENT;
                        //Toast.makeText(getContext(),getString(R.string.txtPatientOverweight),Toast.LENGTH_SHORT).show();
                    }
                    //Severity Status for Weight
                    DatabaseHelper.getInstance(getActivity()).updatePatientStatus(value, flagWeight, Constants.DbConstants.COLUMN_WEIGHT_FLAG, patientVitals.getWeight(), Constants.DbConstants.COLUMN_WEIGHT_VALUE);
                    Toast.makeText(getContext(), getString(R.string.txtTaskBPDataInserted), Toast.LENGTH_SHORT).show();
                    getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientVitalFragment.this).commit();
                    individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientVitalFragment.this.getTag());
                }
            });
            dialog.show();
        } else {
            HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtTaskBPDataNotValid));
        }
    }

    private void referToDoc(String id, String msg) {
        Referal referal = new Referal();
        String refId = PreferanceManager.getAshaId(getActivity()) + "_ref_" + +HealthMonUtility.getReferalNoFromFile(getActivity());
        referal.setRefId(refId);
        referal.setUserId(PreferanceManager.getAshaId(getActivity()));
        referal.setPatientId(value);
        //PatientPersonalInfo patientPersonalInfo = DatabaseHelper.getInstance(getActivity()).getPatient(value);
        //referal.setPatientName(patientPersonalInfo.getFirstName()+" "+patientPersonalInfo.getMiddleName()+" "+patientPersonalInfo.getLastName());
        referal.setPHC_id("1");
        referal.setVillageId("1");
        referal.setReferalNotes(id);
        if(msg.equalsIgnoreCase(getActivity().getResources().getString(R.string.txtPatientUnderWeight))) {
            referal.setReferalReason("Under Weight");
        }else {
            referal.setReferalReason("Over Weight");
        }
        referal.setRefDate(DateUtil.getCurrentTimeStamp());
        referal.setCreatedBy(PreferanceManager.getAshaId(getActivity()));
        referal.setCreatedDate(DateUtil.getCurrentTimeStamp());
        ArrayList<Referal> referals = new ArrayList<Referal>();
        referals.add(referal);
        //DB call
        DatabaseHelper.getInstance(getActivity()).insertReferal(referal);
        //web service call
        WebserviceManager.insertReferal(getActivity(), referals, this);
        HealthMonUtility.showPatientRiskDialog(getActivity(), R.drawable.ic_smiley_red, msg);
    }

    public void initView(View view) {
        txtTemperature = (EditText) view.findViewById(R.id.edtVitalTemp);
        txtHeight = (EditText) view.findViewById(R.id.edtVitalHt);
        txtWeight = (EditText) view.findViewById(R.id.edtVitalWeight);
        txtBMI = (EditText) view.findViewById(R.id.edtVitalBMI);
        txtGirth = (EditText) view.findViewById(R.id.edtVitalGirth);
        txtFundal = (EditText) view.findViewById(R.id.edtVitalFundalWt);
        vitalSave = (Button) view.findViewById(R.id.btVitalsave);
        vitalCancel = (Button) view.findViewById(R.id.btnVitalcancel);
        tv_due = (TextView) view.findViewById(R.id.tv_due);
        tv_ltRcrd = (TextView) view.findViewById(R.id.tv_lt_rcrd);
        rlTabContainer = (RelativeLayout) view.findViewById(R.id.rlTabContainer);
        vitalSave.setOnClickListener(this);
        vitalCancel.setOnClickListener(this);
    }

    @Override
    public void onError(String message) {

    }

    @Override
    public void onResponse(String message) {

    }
}
