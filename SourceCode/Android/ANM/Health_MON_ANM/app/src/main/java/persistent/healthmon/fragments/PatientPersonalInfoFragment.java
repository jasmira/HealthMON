package persistent.healthmon.fragments;

import android.app.DatePickerDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ScaleDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Base64;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.adapter.SpinnerAdapter;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.interfaces.PatientRegistrationTabChange;
import persistent.healthmon.model.PatientPersonalInfo;
import persistent.healthmon.model.SpinerIdValue;
import persistent.healthmon.util.DateUtil;
import persistent.healthmon.util.HealthMonUtility;
import persistent.healthmon.util.PreferanceManager;

/**
 * Created by khyati_shah on 3/16/2016.
 */
public class PatientPersonalInfoFragment extends Fragment implements View.OnClickListener {

    PatientRegistrationTabChange patientRegistrationTabChange;

    public PatientPersonalInfoFragment(PatientRegistrationTabChange patientRegistrationTabChange) {
        this.patientRegistrationTabChange = patientRegistrationTabChange;
    }

    Button btnCapture, btnSave;
    ImageView patientPhoto;
    CheckBox chkBPL;
    EditText edtFirstName, edtMiddleName, edtLastName, edtAge, placeOfBirth, edtLanguage, edtIdCardNum, edtContact, edtEmContact;
    RadioGroup radioGroupGender, radioGroupEducation;
    TextView txtDateOfBirth;
    Spinner spinnerSalutation, spinnerMarritalStatus, spinnerCategory, spinnerIdCardType;
    private static final int CAMERA_REQUEST = 1000;
    String mCurrentPhotoPath;
    byte[] byteArray = new byte[0];
    View view;
    RadioButton radioAge, radioDOB;
    String encodedImage;
    String previouslyEncodedImage;
    SpinnerAdapter categoryAdapter, cardTypeAdapter;
    ArrayList<SpinerIdValue> categoryLst, cardTypes;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_patient_personal_info, null);
        initViews(view);
        return view;
    }


    private void initViews(View view) {
        edtFirstName = (EditText) view.findViewById(R.id.edtFirstName);
        edtMiddleName = (EditText) view.findViewById(R.id.edtMiddleName);
        edtLastName = (EditText) view.findViewById(R.id.edtLastName);
        txtDateOfBirth = (TextView) view.findViewById(R.id.txtDateOfBirth);
        edtAge = (EditText) view.findViewById(R.id.edtAge);
        placeOfBirth = (EditText) view.findViewById(R.id.placeOfBirth);
        edtLanguage = (EditText) view.findViewById(R.id.edtLanguage);
        edtIdCardNum = (EditText) view.findViewById(R.id.edtIdCardNum);
        edtContact = (EditText) view.findViewById(R.id.edtContact);
        edtEmContact = (EditText) view.findViewById(R.id.edtEmContact);
        btnCapture = (Button) view.findViewById(R.id.btnCapture);
        btnSave = (Button) view.findViewById(R.id.btnSave);
        chkBPL = (CheckBox) view.findViewById(R.id.chkBPL);
        patientPhoto = (ImageView) view.findViewById(R.id.patientPhoto);
        spinnerSalutation = (Spinner) view.findViewById(R.id.spinnerSalutation);
        spinnerMarritalStatus = (Spinner) view.findViewById(R.id.spinnerMarritalStatus);
        spinnerCategory = (Spinner) view.findViewById(R.id.spinnerCategory);
        spinnerIdCardType = (Spinner) view.findViewById(R.id.spinnerIdCardType);
        radioGroupGender = (RadioGroup) view.findViewById(R.id.radioGroupGender);
        radioGroupEducation = (RadioGroup) view.findViewById(R.id.radioGroupEducation);
        txtDateOfBirth.setOnClickListener(this);
        btnCapture.setOnClickListener(this);
        btnSave.setOnClickListener(this);
        radioAge = (RadioButton) view.findViewById(R.id.radioAge);
        radioDOB = (RadioButton) view.findViewById(R.id.radioDOB);
        radioAge.setOnClickListener(radioDOBClickListener);
        radioDOB.setOnClickListener(radioDOBClickListener);
        radioAge.setChecked(false);
        edtAge.setEnabled(false);
        edtAge.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

        Drawable drawable = getResources().getDrawable(R.drawable.ic_capture);
        drawable.setBounds(0, 0, (int) (drawable.getIntrinsicWidth() * 0.5),
                (int) (drawable.getIntrinsicHeight() * 0.5));
        ScaleDrawable sd = new ScaleDrawable(drawable, 0, 25, 25);
        btnCapture.setCompoundDrawables(sd.getDrawable(), null, null, null);
        categoryLst = DatabaseHelper.getInstance(getActivity()).getCastCategory();
        categoryAdapter = new SpinnerAdapter(getActivity(), R.layout.spinner_item, categoryLst);
        spinnerCategory.setAdapter(categoryAdapter);
        cardTypes = DatabaseHelper.getInstance(getActivity()).getCardTypeForSpinner();
        cardTypeAdapter = new SpinnerAdapter(getActivity(), R.layout.spinner_item, cardTypes);
        spinnerIdCardType.setAdapter(cardTypeAdapter);
        txtDateOfBirth.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                txtDateOfBirth.setError(null);
            }
        });
        edtAge.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (radioAge.isChecked()) {
                    if (s != null && !s.toString().equalsIgnoreCase("")) {
                        String strDOB = DateUtil.getDateOfBirth(Integer.parseInt(s.toString()));
                        txtDateOfBirth.setText(strDOB);
                    }
                }
            }

            @Override
            public void afterTextChanged(Editable s) {

            }
        });
        //check if data is stoed in preferances
        if (PreferanceManager.getIsRegistrationSessionStored(getActivity())) {
            PatientPersonalInfo patientPersonalInfo = PreferanceManager.getPatientPersonalInfo(getActivity());
            if (patientPersonalInfo != null) {
                spinnerSalutation.setSelection(HealthMonUtility.getSelectedPositionSpinner(spinnerSalutation, patientPersonalInfo.getSalutation()));
                edtFirstName.setText(patientPersonalInfo.getFirstName());
                edtMiddleName.setText(patientPersonalInfo.getMiddleName());
                edtLastName.setText(patientPersonalInfo.getLastName());
                if (patientPersonalInfo.getGenderId() == 1) {
                    radioGroupGender.check(R.id.radioFemale);
                } else {
                    radioGroupGender.check(R.id.radioMale);
                }
                txtDateOfBirth.setText(DateUtil.dateConvert(patientPersonalInfo.getDob(), "yyyy-MM-dd", "dd-MM-yyyy"));
                edtAge.setText(String.valueOf(patientPersonalInfo.getAge()));
                placeOfBirth.setText(patientPersonalInfo.getPlace_of_birth());
                spinnerMarritalStatus.setSelection(HealthMonUtility.getSelectedPositionSpinner(spinnerMarritalStatus, patientPersonalInfo.getMarrital_status()));
                spinnerCategory.setSelection(HealthMonUtility.getSelectedPositionSpinner(categoryLst, patientPersonalInfo.getCategoryId()));
                chkBPL.setChecked(patientPersonalInfo.isBpl());
                edtLanguage.setText(patientPersonalInfo.getLanguage());
                if (patientPersonalInfo.getEducation().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtLiterate))) {
                    radioGroupEducation.check(R.id.radioLiterate);
                } else {
                    radioGroupEducation.check(R.id.radioIlliterate);
                }
                spinnerIdCardType.setSelection(HealthMonUtility.getSelectedPositionSpinner(cardTypes, patientPersonalInfo.getIdCardTypeId()));
                edtIdCardNum.setText(patientPersonalInfo.getIdCardNumber());
                edtContact.setText(patientPersonalInfo.getContact());
                edtEmContact.setText(patientPersonalInfo.getEm_contact());
                previouslyEncodedImage = patientPersonalInfo.getPatient_image_string();
                if (previouslyEncodedImage != null && !previouslyEncodedImage.equalsIgnoreCase("")) {
                    byte[] b = Base64.decode(previouslyEncodedImage, Base64.DEFAULT);
                    Bitmap bitmap = BitmapFactory.decodeByteArray(b, 0, b.length);
                    patientPhoto.setImageBitmap(bitmap);
                }
            }
        }
    }

    View.OnClickListener radioDOBClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            if (v.getId() == R.id.radioAge) {
                if (radioAge.isChecked()) {
                    radioAge.setChecked(true);
                    radioDOB.setChecked(false);
                    edtAge.setEnabled(true);
                    edtAge.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                    txtDateOfBirth.setEnabled(false);
                    txtDateOfBirth.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
                }
            }
            if (v.getId() == R.id.radioDOB) {
                if (radioDOB.isChecked()) {
                    radioDOB.setChecked(true);
                    radioAge.setChecked(false);
                    edtAge.setEnabled(false);
                    edtAge.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
                    txtDateOfBirth.setEnabled(true);
                    txtDateOfBirth.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                }
            }
        }
    };

    //Bitmap bitmap = BitmapFactory.decodeByteArray(patientPersonalInfo.getPatient_image(), 0, patientPersonalInfo.getPatient_image().length);
    //patientPhoto.setImageBitmap(bitmap);

    @Override
    public void onDestroy() {
        patientPhoto.setOnTouchListener(null);
        patientPhoto.setImageBitmap(null);
        System.gc();
        super.onDestroy();
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == CAMERA_REQUEST && resultCode == getActivity().RESULT_OK) {
     /*       Bundle extras = data.getExtras();
            Bitmap imageBitmap = (Bitmap) extras.get("data");
     */
            File imgFile = new File(mCurrentPhotoPath);
            if (imgFile.exists()) {
                Bitmap myBitmap = BitmapFactory.decodeFile(imgFile.getAbsolutePath());
                BitmapFactory.Options options = null;
                options = new BitmapFactory.Options();
                options.inSampleSize = 2;
                Bitmap bitmap = BitmapFactory.decodeFile(imgFile.getAbsolutePath(), options);

                patientPhoto.setImageBitmap(bitmap);
                //patientPhoto.setImageBitmap(ImageResizer
                //      .decodeSampledBitmapFromFile(imgFile.getPath(), 40, 40));
                // /    ByteArrayOutputStream stream = new ByteArrayOutputStream();
                //   myBitmap.compress(Bitmap.CompressFormat.PNG, 100, stream);
                // byteArray = stream.toByteArray();
                byteArray = HealthMonUtility.getBitmapAsByteArray(bitmap);
            }
        }
    }


    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btnSave) {

            performSvaeNext();


        }
        if (v.getId() == R.id.btnCapture) {
            capturePatientPhoto();
        }
        if (v.getId() == R.id.txtDateOfBirth) {
            HealthMonUtility.showDatePicker(getActivity(), myDateListener);
        }
    }


    public void performSvaeNext() {
        PatientPersonalInfo patientPersonalInfo = new PatientPersonalInfo();
        patientPersonalInfo.setPatient_id(PreferanceManager.getAshaId(getActivity()) + HealthMonUtility.getPatientSerialNoFromFile(getActivity()));
        patientPersonalInfo.setAsha_id(PreferanceManager.getAshaId(getActivity()));

        if (edtFirstName.getText() != null && !edtFirstName.getText().toString().equalsIgnoreCase("")) {
            if (edtFirstName.getText().toString().trim().length() < 3) {
                edtFirstName.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtFirstName.requestFocus();
                return;
            } else
                patientPersonalInfo.setFirstName(edtFirstName.getText().toString());
        } else {
            edtFirstName.setError(getActivity().getString(R.string.txtEnterValue));
            edtFirstName.requestFocus();
            return;
        }
        encodedImage = Base64.encodeToString(byteArray, Base64.DEFAULT);
        patientPersonalInfo.setPatient_image_string(encodedImage);
        patientPersonalInfo.setSalutation(spinnerSalutation.getSelectedItem().toString());

        if (edtMiddleName.getText() != null && !edtMiddleName.getText().toString().equalsIgnoreCase("")) {
            if (edtMiddleName.getText().toString().trim().length() < 3) {
                edtMiddleName.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtMiddleName.requestFocus();
                return;
            } else
                patientPersonalInfo.setMiddleName(edtMiddleName.getText().toString());
        } else {
            edtMiddleName.setError(getActivity().getString(R.string.txtEnterValue));
            edtMiddleName.requestFocus();
            return;
        }

        if (edtLastName.getText() != null && !edtLastName.getText().toString().equalsIgnoreCase("")) {
            if (edtLastName.getText().toString().trim().length() < 3) {
                edtLastName.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtLastName.requestFocus();
                return;
            } else
                patientPersonalInfo.setLastName(edtLastName.getText().toString());
        } else {
            edtLastName.setError(getActivity().getString(R.string.txtEnterValue));
            edtLastName.requestFocus();
            return;
        }
        int id = radioGroupGender.getCheckedRadioButtonId();
        RadioButton radioButtonGender = (RadioButton) view.findViewById(id);
        if (radioButtonGender.getText().toString().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtFemale))) {
            patientPersonalInfo.setGenderId(1);
        } else {
            patientPersonalInfo.setGenderId(2);
        }

        if (txtDateOfBirth.getText() != null && !txtDateOfBirth.getText().toString().equalsIgnoreCase("")) {
            if (DateUtil.isToday(txtDateOfBirth.getText().toString())) {
                txtDateOfBirth.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                txtDateOfBirth.requestFocus();
                return;
            }
            String convertedDt = DateUtil.dateConvert(txtDateOfBirth.getText().toString(), "dd-MM-yyyy", "yyyy-MM-dd");
            patientPersonalInfo.setDob(convertedDt);
        } else {
            txtDateOfBirth.setError(getActivity().getString(R.string.txtEnterValue));
            txtDateOfBirth.requestFocus();
            return;
        }

        if (edtAge.getText() != null && !edtAge.getText().toString().equalsIgnoreCase("")) {
            if (Integer.valueOf(edtAge.getText().toString()) < 18 || Integer.valueOf(edtAge.getText().toString()) > 55) {
                edtAge.setError(getActivity().getString(R.string.txtPatientageshouldbetween18to55));
                edtAge.requestFocus();
                return;
            }
            patientPersonalInfo.setAge(Integer.valueOf(edtAge.getText().toString()));
        } else {
            edtAge.setError(getActivity().getString(R.string.txtEnterValue));
            edtAge.requestFocus();
            return;
        }

        if (placeOfBirth.getText() != null && !placeOfBirth.getText().toString().equalsIgnoreCase("")) {
            if (placeOfBirth.getText().toString().trim().length() < 3) {
                placeOfBirth.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                placeOfBirth.requestFocus();
                return;
            }
            patientPersonalInfo.setPlace_of_birth(placeOfBirth.getText().toString());
        } else {
            placeOfBirth.setError(getActivity().getString(R.string.txtEnterValue));
            placeOfBirth.requestFocus();
            return;
        }
        patientPersonalInfo.setMarrital_status(spinnerMarritalStatus.getSelectedItem().toString());
        int selectedId = spinnerCategory.getSelectedItemPosition();
        patientPersonalInfo.setCategoryId(categoryLst.get(selectedId).getId());
        if (chkBPL.isChecked())
            patientPersonalInfo.setBpl(true);
        else
            patientPersonalInfo.setBpl(false);

        if (edtLanguage.getText() != null && !edtLanguage.getText().toString().equalsIgnoreCase("")) {
            if (edtLanguage.getText().toString().trim().length() < 3) {
                edtLanguage.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtLanguage.requestFocus();
                return;
            }
            patientPersonalInfo.setLanguage(edtLanguage.getText().toString());
        } else {
            edtLanguage.setError(getActivity().getString(R.string.txtEnterValue));
            edtLanguage.requestFocus();
            return;
        }

        id = radioGroupEducation.getCheckedRadioButtonId();
        RadioButton radioBtnEducation = (RadioButton) view.findViewById(id);
        patientPersonalInfo.setEducation(radioBtnEducation.getText().toString());
        selectedId = spinnerIdCardType.getSelectedItemPosition();
        patientPersonalInfo.setIdCardTypeId(cardTypes.get(selectedId).getId());

        if (edtIdCardNum.getText() != null && !edtIdCardNum.getText().toString().equalsIgnoreCase("")) {
            //check for minumum value
            if (edtIdCardNum.getText().toString().trim().length() < 10) {
                edtIdCardNum.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtIdCardNum.requestFocus();
                return;
            }
            //check for maximum - maximum value fro Adhar card
            if (cardTypes.get(selectedId).getId() == 1) {
                if (edtIdCardNum.getText().toString().trim().length() < 12 || edtIdCardNum.getText().toString().trim().length() > 12) {
                    edtIdCardNum.setError(getActivity().getString(R.string.txtAadharCardShouldbeof12Digits));
                    edtIdCardNum.requestFocus();
                    return;
                }
            }

            //check for maximum - maximum value fro Ration Card
            if (spinnerIdCardType.getSelectedItem().toString().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtRationCard))) {
                if (edtIdCardNum.getText().toString().trim().length() < 12 || edtIdCardNum.getText().toString().trim().length() > 12) {
                    edtIdCardNum.setError(getActivity().getString(R.string.txtRationCardShouldbeof12Digits));
                    edtIdCardNum.requestFocus();
                    return;
                }
            }

            //check for maximum - maximum value fro Ration Card
            if (cardTypes.get(selectedId).getId() == 2) {
                if (edtIdCardNum.getText().toString().trim().length() < 10 || edtIdCardNum.getText().toString().trim().length() > 20) {
                    edtIdCardNum.setError(getActivity().getString(R.string.txtPanCardShouldbeof10to20Digits));
                    edtIdCardNum.requestFocus();
                    return;
                }
            }
            patientPersonalInfo.setIdCardNumber(edtIdCardNum.getText().toString());
        } else {
            edtIdCardNum.setError(getActivity().getString(R.string.txtEnterValue));
            edtIdCardNum.requestFocus();
            return;
        }

        if (edtContact.getText() != null && !edtContact.getText().toString().equalsIgnoreCase("")) {
            if (edtContact.getText().toString().length() < 10) {
                edtContact.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtContact.requestFocus();
                return;
            }
            patientPersonalInfo.setContact(edtContact.getText().toString());
        } else {
            edtContact.setError(getActivity().getString(R.string.txtEnterValue));
            edtContact.requestFocus();
            return;
        }

        if (edtEmContact.getText() != null && !edtEmContact.getText().toString().equalsIgnoreCase("")) {
            if (edtEmContact.getText().toString().length() < 10) {
                edtEmContact.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtEmContact.requestFocus();
                return;
            }
            patientPersonalInfo.setEm_contact(edtEmContact.getText().toString());
        } else {
            edtEmContact.setError(getActivity().getString(R.string.txtEnterValue));
            edtEmContact.requestFocus();
            return;
        }
        patientPersonalInfo.setIs_Submitted(false);
        patientPersonalInfo.setIs_Uploaded(false);

        //store data in preferences
        PreferanceManager.setPatientPersonalInfo(getActivity(), patientPersonalInfo);
        PatientPersonalInfo patientPersonalInfo1 = PreferanceManager.getPatientPersonalInfo(getActivity());
        HealthMonUtility.reloadFragment(getActivity(), new AddressFragment(this.patientRegistrationTabChange), R.id.patientRegistrationContiner);
        patientRegistrationTabChange.onTabChange(AddressFragment.class.toString());
        //personal info DB call

        //DatabaseHelper.getInstance(getActivity()).insertPatientPersonalInfo(patientPersonalInfo, null);
        //PatientPersonalInfo patientPersonalInfo = DatabaseHelper.getInstance(getActivity()).getPatient(1);
        //personal info webservice call
//        WebserviceManager.insertPersonalInfo(getActivity(), patientPersonalInfo);
    }

    private void capturePatientPhoto() {
        String fileName = "1" + "jpg";
        File photoFile = null;

        try {
            photoFile = createImageFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        if (takePictureIntent.resolveActivity(getActivity().getPackageManager()) != null) {
            takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT,
                    Uri.fromFile(photoFile));

            startActivityForResult(takePictureIntent, CAMERA_REQUEST);
        }
    }

    private File createImageFile() throws IOException {
        // Create an image file name
        String imageFileName = "Patient1";
        File storageDir = Environment.getExternalStorageDirectory();
        //  Environment.DIRECTORY_PICTURES);
        File image = File.createTempFile(
                imageFileName,  /* prefix */
                ".jpg",         /* suffix */
                storageDir      /* directory */
        );

        // Save a file: path for use with ACTION_VIEW intents
        //mCurrentPhotoPath = "file:" + image.getAbsolutePath();
        mCurrentPhotoPath = image.getAbsolutePath();
        return image;
    }

    private DatePickerDialog.OnDateSetListener myDateListener = new DatePickerDialog.OnDateSetListener() {
        @Override
        public void onDateSet(DatePicker arg0, int arg1, int arg2, int arg3) {
            // TODO Auto-generated method stub
            // arg1 = year
            // arg2 = month
            // arg3 = day
            //validation on DOB and Age
            arg2++;

            int age = DateUtil.getAge(arg3 + "-" + arg2 + "-" + arg1);

            if (DateUtil.isToday(arg3 + "-" + arg2 + "-" + arg1)) {
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtIncorrectDateOfBirth));
                txtDateOfBirth.requestFocus();
                return;
            }
            if (age < 18 || age > 55) {
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtPatientageshouldbetween18to55));
                txtDateOfBirth.requestFocus();
                return;
            }

            txtDateOfBirth.setText(arg3 + "-" + arg2 + "-" + arg1);
            edtAge.setText(String.valueOf(age));
        }
    };
}
