package com.persistent.healthmon.fragments;

import android.app.DatePickerDialog;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.interfaces.PatientRegistrationTabChange;
import com.persistent.healthmon.model.ProgramInfo;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;

/**
 * Created by khyati_shah on 3/30/2016.
 */
public class ProgramInformationFragment extends BaseFragment implements View.OnClickListener {

    PatientRegistrationTabChange patientRegistrationTabChange;
    Button btnSaveProceed;
    RadioGroup radioGroupPregnancy;
    RelativeLayout llPrgnancyOption;
    Spinner multispinnerProgram, spinnerDeliveryNature;
    TextView txtLMPDate, txtEDD;
    EditText edtNotes, edtGravida, edtParity, edtAbortions, edtStillBirths, edtLivingChildren, txtPreviousDeliveryDate;
    View view;
    ImageView imgGravidaPlus, imgGravidaMinus, imgParityMinus, imgParityPlus, imgAbortionMinus, imgAbortionPlus, imgStillBirthMinus, imgStillBirthPlus, imgLivingChildrenMinus, imgLivingChildrenPlus;
    TextView lblGravida, lblParity, lblPastAbortions, lblPastStillBirths, lblLivingChildren, lblPreviousDeliveryDate, lblNatureDelivery;


    public ProgramInformationFragment(PatientRegistrationTabChange patientRegistrationTabChange) {
        this.patientRegistrationTabChange = patientRegistrationTabChange;
    }


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_program_information, null);
        initView(view);
        return view;
    }

    private void initView(View view) {
        txtLMPDate = (TextView) view.findViewById(R.id.txtLMPDate);
        txtEDD = (TextView) view.findViewById(R.id.txtEDD);
        btnSaveProceed = (Button) view.findViewById(R.id.btnSaveProceed);
        llPrgnancyOption = (RelativeLayout) view.findViewById(R.id.llPrgnancyOption);
        radioGroupPregnancy = (RadioGroup) view.findViewById(R.id.radioGroupPregnancy);
        multispinnerProgram = (Spinner) view.findViewById(R.id.multispinnerProgram);
        spinnerDeliveryNature = (Spinner) view.findViewById(R.id.spinnerDeliveryNature);
        edtNotes = (EditText) view.findViewById(R.id.edtNotes);
        edtGravida = (EditText) view.findViewById(R.id.edtGravida);
        edtParity = (EditText) view.findViewById(R.id.edtParity);
        edtAbortions = (EditText) view.findViewById(R.id.edtAbortions);
        edtStillBirths = (EditText) view.findViewById(R.id.edtStillBirths);
        edtLivingChildren = (EditText) view.findViewById(R.id.edtLivingChildren);
        txtPreviousDeliveryDate = (EditText) view.findViewById(R.id.txtPreviousDeliveryDate);
        lblGravida = (TextView) view.findViewById(R.id.lblGravida);
        lblParity = (TextView) view.findViewById(R.id.lblParity);
        lblPastAbortions = (TextView) view.findViewById(R.id.lblPastAbortions);
        lblPastStillBirths = (TextView) view.findViewById(R.id.lblPastStillBirths);
        lblLivingChildren = (TextView) view.findViewById(R.id.lblLivingChildren);
        lblPreviousDeliveryDate = (TextView) view.findViewById(R.id.lblPreviousDeliveryDate);
        lblNatureDelivery = (TextView) view.findViewById(R.id.lblNatureDelivery);
        imgGravidaPlus = (ImageView) view.findViewById(R.id.imgGravidaPlus);

        imgGravidaPlus.setOnClickListener(pragOptionPlusClickListener);

        imgGravidaMinus = (ImageView) view.findViewById(R.id.imgGravidaMinus);
        imgGravidaMinus.setOnClickListener(pragOptionMinusClickListener);

        imgParityMinus = (ImageView) view.findViewById(R.id.imgParityMinus);
        imgParityMinus.setOnClickListener(pragOptionMinusClickListener);

        imgParityPlus = (ImageView) view.findViewById(R.id.imgParityPlus);
        imgParityPlus.setOnClickListener(pragOptionPlusClickListener);

        imgAbortionMinus = (ImageView) view.findViewById(R.id.imgAbortionMinus);
        imgAbortionMinus.setOnClickListener(pragOptionMinusClickListener);

        imgAbortionPlus = (ImageView) view.findViewById(R.id.imgAbortionPlus);
        imgAbortionPlus.setOnClickListener(pragOptionPlusClickListener);

        imgStillBirthMinus = (ImageView) view.findViewById(R.id.imgStillBirthMinus);
        imgStillBirthMinus.setOnClickListener(pragOptionMinusClickListener);

        imgStillBirthPlus = (ImageView) view.findViewById(R.id.imgStillBirthPlus);
        imgStillBirthPlus.setOnClickListener(pragOptionPlusClickListener);

        imgLivingChildrenMinus = (ImageView) view.findViewById(R.id.imgLivingChildrenMinus);
        imgLivingChildrenMinus.setOnClickListener(pragOptionMinusClickListener);

        imgLivingChildrenPlus = (ImageView) view.findViewById(R.id.imgLivingChildrenPlus);
        imgLivingChildrenPlus.setOnClickListener(pragOptionPlusClickListener);

        txtLMPDate.setOnClickListener(this);
        txtLMPDate.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                txtLMPDate.setError(null);
            }
        });
        txtEDD.setOnClickListener(this);
        txtPreviousDeliveryDate.setOnClickListener(this);
        //llPrgnancyOption.setEnabled(false);
        disablePragDetail();
        btnSaveProceed.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                performSaveProceed();

            }
        });
        radioGroupPregnancy.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {

            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                // find which radio button is selected
                if (checkedId == R.id.radioYes) {
                    //llPrgnancyOption.setVisibility(View.GONE);
                    disablePragDetail();

                } else if (checkedId == R.id.radioNo) {
                    enablePragDetail();
                    edtGravida.setText("0");
                    edtGravida.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));

                    edtParity.setText("0");
                    edtParity.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));

                    edtAbortions.setText("0");
                    edtAbortions.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));

                    edtStillBirths.setText("0");
                    edtStillBirths.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));

                    edtLivingChildren.setText("0");
                    edtLivingChildren.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));

                    spinnerDeliveryNature.setSelection(0);
                    txtPreviousDeliveryDate.setText("");

                }
            }

        });

        //check for shared preferances data
        if (PreferanceManager.getIsRegistrationSessionStored(getActivity())) {
            ProgramInfo programInfo = PreferanceManager.getPatientProgramInfo(getActivity());
            if (programInfo != null) {
                txtEDD.setText(DateUtil.dateConvert(programInfo.getEDD(), "yyyy-MM-dd", "dd-MM-yyyy"));
                txtLMPDate.setText(DateUtil.dateConvert(programInfo.getLMPDate(), "yyyy-MM-dd", "dd-MM-yyyy"));
                if (programInfo.isFirstPregnancy()) {
                    radioGroupPregnancy.check(R.id.radioYes);
                    disablePragDetail();

                } else {
                    enablePragDetail();
                    radioGroupPregnancy.check(R.id.radioNo);
                    edtGravida.setText(programInfo.getGravida());
                    if (Integer.parseInt(programInfo.getGravida()) > 0) {
                        //edtGravida.setTextColor(getActivity().getResources().getColor(R.color.colorred));
                    }
                    edtParity.setText(programInfo.getParity());
                    if (Integer.parseInt(programInfo.getParity()) > 0) {
                        edtParity.setTextColor(getActivity().getResources().getColor(R.color.colorred));
                    }
                    edtAbortions.setText(programInfo.getPastAbortions());
                    if (Integer.parseInt(programInfo.getPastAbortions()) > 0) {
                        edtAbortions.setTextColor(getActivity().getResources().getColor(R.color.colorred));
                    }
                    edtStillBirths.setText(programInfo.getPastStillBirths());
                    if (Integer.parseInt(programInfo.getPastStillBirths()) > 0) {
                        edtStillBirths.setTextColor(getActivity().getResources().getColor(R.color.colorred));
                    }
                    edtLivingChildren.setText(programInfo.getLivingChildren());
                    /*if (Integer.parseInt(programInfo.getLivingChildren()) > 0) {
                        ///edtLivingChildren.setTextColor(getActivity().getResources().getColor(R.color.colorred));
                    }*/
                    txtPreviousDeliveryDate.setText(DateUtil.dateConvert(programInfo.getPreviousDeliveryDate(), "yyyy-MM-dd", "dd-MM-yyyy"));
                    spinnerDeliveryNature.setSelection(HealthMonUtility.getSelectedPositionSpinner(spinnerDeliveryNature, programInfo.getNatureofPreviousDelivery()));
                }
                edtNotes.setText(programInfo.getNotes());

            }
        }
    }

    private void disablePragDetail() {
        lblGravida.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        lblParity.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        lblPastAbortions.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        lblPastStillBirths.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        lblLivingChildren.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        lblPreviousDeliveryDate.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        lblNatureDelivery.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

        edtGravida.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        edtParity.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        edtAbortions.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        edtStillBirths.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        edtLivingChildren.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        txtPreviousDeliveryDate.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

        Drawable drawablePlusGray = ContextCompat.getDrawable(getActivity(), R.drawable.ic_plus_gray);
        Drawable drawableMinusGray = ContextCompat.getDrawable(getActivity(), R.drawable.ic_minus_gray);
        Drawable drawableCaleder = ContextCompat.getDrawable(getActivity(), R.drawable.ic_calender_gray);
        imgGravidaPlus.setImageDrawable(drawablePlusGray);
        imgParityPlus.setImageDrawable(drawablePlusGray);
        imgAbortionPlus.setImageDrawable(drawablePlusGray);
        imgStillBirthPlus.setImageDrawable(drawablePlusGray);
        imgLivingChildrenPlus.setImageDrawable(drawablePlusGray);
        imgGravidaMinus.setImageDrawable(drawableMinusGray);
        imgParityMinus.setImageDrawable(drawableMinusGray);
        imgAbortionMinus.setImageDrawable(drawableMinusGray);
        imgStillBirthMinus.setImageDrawable(drawableMinusGray);
        imgLivingChildrenMinus.setImageDrawable(drawableMinusGray);
        txtPreviousDeliveryDate.setCompoundDrawablesWithIntrinsicBounds(null, null, drawableCaleder, null);
        setViewAndChildrenEnabled(llPrgnancyOption, false);

    }

    private void enablePragDetail() {
        lblGravida.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        lblParity.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        lblPastAbortions.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        lblPastStillBirths.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        lblLivingChildren.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        lblPreviousDeliveryDate.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        lblNatureDelivery.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        Drawable drawablePlus = ContextCompat.getDrawable(getActivity(), R.drawable.ic_plus);
        Drawable drawableMinus = ContextCompat.getDrawable(getActivity(), R.drawable.ic_minus);
        Drawable drawableCaleder = ContextCompat.getDrawable(getActivity(), R.drawable.ic_calender);
        imgGravidaPlus.setImageDrawable(drawablePlus);
        imgParityPlus.setImageDrawable(drawablePlus);
        imgAbortionPlus.setImageDrawable(drawablePlus);
        imgStillBirthPlus.setImageDrawable(drawablePlus);
        imgLivingChildrenPlus.setImageDrawable(drawablePlus);
        imgGravidaMinus.setImageDrawable(drawableMinus);
        imgParityMinus.setImageDrawable(drawableMinus);
        imgAbortionMinus.setImageDrawable(drawableMinus);
        imgStillBirthMinus.setImageDrawable(drawableMinus);
        imgLivingChildrenMinus.setImageDrawable(drawableMinus);
        txtPreviousDeliveryDate.setCompoundDrawablesWithIntrinsicBounds(null, null, drawableCaleder, null);
        setViewAndChildrenEnabled(llPrgnancyOption, true);

        if (Integer.parseInt(edtGravida.getText().toString()) > 0) {
            // edtGravida.setTextColor(getActivity().getResources().getColor(R.color.colorred));
        } else {
            edtGravida.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        }

        if (Integer.parseInt(edtParity.getText().toString()) > 0) {
            edtParity.setTextColor(getActivity().getResources().getColor(R.color.colorred));
        } else {
            edtParity.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        }

        if (Integer.parseInt(edtAbortions.getText().toString()) > 0) {
            edtAbortions.setTextColor(getActivity().getResources().getColor(R.color.colorred));
        } else {
            edtAbortions.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        }

        if (Integer.parseInt(edtStillBirths.getText().toString()) > 0) {
            edtStillBirths.setTextColor(getActivity().getResources().getColor(R.color.colorred));
        } else {
            edtStillBirths.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        }

        if (Integer.parseInt(edtLivingChildren.getText().toString()) > 0) {
            // edtLivingChildren.setTextColor(getActivity().getResources().getColor(R.color.colorred));
        } else {
            edtLivingChildren.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
        }
        txtPreviousDeliveryDate.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));

    }


    private void setViewAndChildrenEnabled(View view, boolean enabled) {
        view.setEnabled(enabled);
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                View child = viewGroup.getChildAt(i);
                setViewAndChildrenEnabled(child, enabled);
            }
        }
    }

    private void performSaveProceed() {
        boolean isAtRisk = false;
        ProgramInfo programInfo = new ProgramInfo();
        if (multispinnerProgram.getSelectedItem().toString().equalsIgnoreCase("")) {
            HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtSelectProgram));
            return;
        } else {
            programInfo.setProgram_name(multispinnerProgram.getSelectedItem().toString());
        }
        if (txtLMPDate.getText() != null && !txtLMPDate.getText().toString().equalsIgnoreCase("")) {
            if (DateUtil.isToday(txtLMPDate.getText().toString())) {
                txtLMPDate.setError(getActivity().getResources().getString(R.string.txtEnterCorrectValue));
                txtLMPDate.requestFocus();
                return;
            }
            if (!DateUtil.isValidLMP(txtLMPDate.getText().toString())) {
                txtLMPDate.setError(getActivity().getResources().getString(R.string.txtEnterCorrectValue));
                txtLMPDate.requestFocus();
                return;
            }
            if (DateUtil.isFutureDate(txtLMPDate.getText().toString())) {
                txtLMPDate.setError(getActivity().getResources().getString(R.string.txtEnterCorrectValue));
                txtLMPDate.requestFocus();
                return;
            }
            String convertedDt = DateUtil.dateConvert(txtLMPDate.getText().toString(), "dd-MM-yyyy", "yyyy-MM-dd");
            programInfo.setLMPDate(convertedDt);
        } else {
            txtLMPDate.setError(getActivity().getResources().getString(R.string.txtEnterValue));
            txtLMPDate.requestFocus();
            programInfo.setLMPDate("0000-00-00");
            return;
        }
        if (txtEDD.getText() != null && !txtEDD.getText().toString().equalsIgnoreCase("")) {
            String convertedDt = DateUtil.dateConvert(txtEDD.getText().toString(), "dd-MM-yyyy", "yyyy-MM-dd");
            programInfo.setEDD(convertedDt);
        } else {
            txtEDD.setError(getActivity().getResources().getString(R.string.txtEnterValue));
            txtEDD.requestFocus();
            programInfo.setEDD("0000-00-00");
            return;
        }

        int id = radioGroupPregnancy.getCheckedRadioButtonId();
        RadioButton radioButtonFirstPrag = (RadioButton) view.findViewById(id);
        if (radioButtonFirstPrag.getText().toString().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtYes))) {
            programInfo.setIsFirstPregnancy(true);
            programInfo.setGravida("0");
            programInfo.setParity("0");
            programInfo.setPastAbortions("0");
            programInfo.setPastStillBirths("0");
            programInfo.setLivingChildren("0");
            programInfo.setNatureofPreviousDelivery("");
            programInfo.setPreviousDeliveryDate("0000-00-00");
        } else {
            if (!checkGravida()) {
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.msgGravidaCountshouldmatchallotherparameter));
                return;
            }
            programInfo.setIsFirstPregnancy(false);
            programInfo.setGravida(edtGravida.getText().toString());
            programInfo.setParity(edtParity.getText().toString());
            programInfo.setPastAbortions(edtAbortions.getText().toString());
            programInfo.setPastStillBirths(edtStillBirths.getText().toString());
            programInfo.setLivingChildren(edtLivingChildren.getText().toString());
            programInfo.setNatureofPreviousDelivery(spinnerDeliveryNature.getSelectedItem().toString());
            if (txtPreviousDeliveryDate.getText() != null && !txtPreviousDeliveryDate.getText().toString().equalsIgnoreCase("")) {
                programInfo.setPreviousDeliveryDate(DateUtil.dateConvert(txtPreviousDeliveryDate.getText().toString(), "dd-MM-yyyy", "yyyy-MM-dd"));
            } else {
                programInfo.setPreviousDeliveryDate("0000-00-00");
            }
            if (Integer.parseInt(edtAbortions.getText().toString()) > 0 || Integer.parseInt(edtStillBirths.getText().toString()) > 0) {
                isAtRisk = true;
            }
            if (spinnerDeliveryNature.getSelectedItem().toString().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtCesarean))
                    || spinnerDeliveryNature.getSelectedItem().toString().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtForceps))
                    || spinnerDeliveryNature.getSelectedItem().toString().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtVacuum))) {
                isAtRisk = true;
            }
        }
        if (edtNotes.getText() != null && !edtNotes.getText().toString().equalsIgnoreCase("")) {
            if (edtNotes.getText().toString().length() < 2) {
                edtNotes.setError(getActivity().getResources().getString(R.string.txtEnterCorrectValue));
                return;
            }
            programInfo.setNotes(edtNotes.getText().toString());
        } else {
            programInfo.setNotes("");
        }
        if (isAtRisk)
            HealthMonUtility.showPatientRiskDialog(getActivity(), R.drawable.ic_smiley_red, getActivity().getResources().getString(R.string.msgPatientHighRisk));
        PreferanceManager.setPatientProgramInfo(getActivity(), programInfo);
        ProgramInfo programInfo1 = PreferanceManager.getPatientProgramInfo(getActivity());
        HealthMonUtility.reloadFragment(getActivity(), new PatientFamlyInfoFragment(this.patientRegistrationTabChange), R.id.patientRegistrationContiner);
        patientRegistrationTabChange.onTabChange(PatientFamlyInfoFragment.class.toString());
    }

    private boolean checkGravida() {
        boolean isValid = false;
        int gravida, parity, pastAbortions, pastStillBirths, livingChildren;
        gravida = Integer.parseInt(edtGravida.getText().toString());
        parity = Integer.parseInt(edtParity.getText().toString());
        pastAbortions = Integer.parseInt(edtAbortions.getText().toString());
        pastStillBirths = Integer.parseInt(edtStillBirths.getText().toString());
        livingChildren = Integer.parseInt(edtLivingChildren.getText().toString());
        if (gravida != (parity + pastAbortions + pastStillBirths + 1)) {
            isValid = false;
            return isValid;
        }
        if (gravida == 1) {
            if (parity == 0 && pastAbortions == 0 && pastStillBirths == 0 && livingChildren == 0) {
                isValid = false;
                return isValid;
            }

        }
        isValid = true;

        return isValid;
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.txtLMPDate) {
            HealthMonUtility.showDatePicker(getActivity(), dtListenerLMPDt);
        }
        if (v.getId() == R.id.txtEDD) {
            HealthMonUtility.showDatePicker(getActivity(), dtListenerEDD);
        }
        if (v.getId() == R.id.txtPreviousDeliveryDate) {
            HealthMonUtility.showDatePicker(getActivity(), dtLastPragDate);
        }
    }

    private DatePickerDialog.OnDateSetListener dtListenerLMPDt = new DatePickerDialog.OnDateSetListener() {
        @Override
        public void onDateSet(DatePicker arg0, int arg1, int arg2, int arg3) {
            // TODO Auto-generated method stub
            // arg1 = year
            // arg2 = month
            // arg3 = day
            arg2++;
            //validations for LMP Date
            if (DateUtil.isToday(arg3 + "-" + arg2 + "-" + arg1)) {
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtLMPDateCanNotBeTodayDate));
                txtLMPDate.requestFocus();
                return;
            }
            if (!DateUtil.isValidLMP(arg3 + "-" + arg2 + "-" + arg1)) {
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtLMPDateCanNotBeBefore9Months));
                txtLMPDate.requestFocus();
                return;
            }
            if (DateUtil.isFutureDate(arg3 + "-" + arg2 + "-" + arg1)) {
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtLMPDateCanNotBeFutureDate));
                txtLMPDate.requestFocus();
                return;
            }
            txtLMPDate.setText(arg3 + "-" + arg2 + "-" + arg1);
            String strEDDDate = DateUtil.getEDDDate(arg3 + "-" + arg2 + "-" + arg1);
            txtEDD.setText(strEDDDate);
        }
    };

    private DatePickerDialog.OnDateSetListener dtListenerEDD = new DatePickerDialog.OnDateSetListener() {
        @Override
        public void onDateSet(DatePicker arg0, int arg1, int arg2, int arg3) {
            // TODO Auto-generated method stub
            // arg1 = year
            // arg2 = month
            // arg3 = day
            arg2++;
            txtEDD.setText(arg3 + "-" + arg2 + "-" + arg1);
        }
    };
    private DatePickerDialog.OnDateSetListener dtLastPragDate = new DatePickerDialog.OnDateSetListener() {
        @Override
        public void onDateSet(DatePicker arg0, int arg1, int arg2, int arg3) {
            // TODO Auto-generated method stub
            // arg1 = year
            // arg2 = month
            // arg3 = day
            arg2++;
            if (DateUtil.isFutureDate(arg3 + "-" + arg2 + "-" + arg1)) {
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtPreviousDeliveryDateCanNotBeFutureDate));
                txtPreviousDeliveryDate.requestFocus();
                return;
            }
            if (DateUtil.isToday(arg3 + "-" + arg2 + "-" + arg1)) {
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtPreviousDeliveryCanNotBeTodayDate));
                txtPreviousDeliveryDate.requestFocus();
                return;
            }

            if (DateUtil.isValidPastDeliveryDt(arg3 + "-" + arg2 + "-" + arg1)) {
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtPreviousDeliveryShouldbefore10months));
                txtPreviousDeliveryDate.requestFocus();
                return;
            }
            txtPreviousDeliveryDate.setText(arg3 + "-" + arg2 + "-" + arg1);
        }
    };

    private View.OnClickListener pragOptionPlusClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            int count;
            if (v.getId() == R.id.imgGravidaPlus) {
                count = Integer.parseInt(edtGravida.getText().toString());
                if (count < 10) {
                    count++;

                } else {
                    count = 10;
                }
                //   edtGravida.setTextColor(getActivity().getResources().getColor(R.color.colorred));
                edtGravida.setText(String.valueOf(count));
            }
            if (v.getId() == R.id.imgParityPlus) {
                count = Integer.parseInt(edtParity.getText().toString());
                if (count < 10) {
                    count++;

                } else {
                    count = 10;
                }
                edtParity.setTextColor(getActivity().getResources().getColor(R.color.colorred));
                edtParity.setText(String.valueOf(count));

            }
            if (v.getId() == R.id.imgAbortionPlus) {
                count = Integer.parseInt(edtAbortions.getText().toString());
                if (count < 10) {
                    count++;

                } else {
                    count = 10;
                }
                edtAbortions.setTextColor(getActivity().getResources().getColor(R.color.colorred));
                edtAbortions.setText(String.valueOf(count));
            }
            if (v.getId() == R.id.imgStillBirthPlus) {
                count = Integer.parseInt(edtStillBirths.getText().toString());
                if (count < 10) {
                    count++;

                } else {
                    count = 10;
                }
                edtStillBirths.setTextColor(getActivity().getResources().getColor(R.color.colorred));
                edtStillBirths.setText(String.valueOf(count));
            }
            if (v.getId() == R.id.imgLivingChildrenPlus) {
                count = Integer.parseInt(edtLivingChildren.getText().toString());
                if (count < 10) {
                    count++;

                } else {
                    count = 10;
                }
                // edtLivingChildren.setTextColor(getActivity().getResources().getColor(R.color.colorred));
                edtLivingChildren.setText(String.valueOf(count));
            }

        }
    };
    private View.OnClickListener pragOptionMinusClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            int count;
            if (v.getId() == R.id.imgGravidaMinus) {
                count = Integer.parseInt(edtGravida.getText().toString());
                if (count > 0) {
                    count--;
                } else {
                    count = 0;
                    edtGravida.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                }
                edtGravida.setText(String.valueOf(count));
            }
            if (v.getId() == R.id.imgParityMinus) {
                count = Integer.parseInt(edtParity.getText().toString());
                if (count > 0) {
                    count--;
                } else {
                    count = 0;
                    edtParity.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                }
                if (count == 0) {
                    edtParity.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                }
                edtParity.setText(String.valueOf(count));
            }
            if (v.getId() == R.id.imgAbortionMinus) {
                count = Integer.parseInt(edtAbortions.getText().toString());
                if (count > 0) {
                    count--;
                } else {
                    count = 0;
                    edtAbortions.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                }
                if (count == 0) {
                    edtAbortions.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                }
                edtAbortions.setText(String.valueOf(count));
            }
            if (v.getId() == R.id.imgStillBirthMinus) {
                count = Integer.parseInt(edtStillBirths.getText().toString());
                if (count > 0) {
                    count--;
                } else {
                    count = 0;
                    edtStillBirths.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                }
                if (count == 0) {
                    edtStillBirths.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                }
                edtStillBirths.setText(String.valueOf(count));
            }
            if (v.getId() == R.id.imgLivingChildrenMinus) {
                count = Integer.parseInt(edtLivingChildren.getText().toString());
                if (count > 0) {
                    count--;
                } else {
                    count = 0;
                    edtLivingChildren.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                }
                edtLivingChildren.setText(String.valueOf(count));
            }
        }
    };
}
