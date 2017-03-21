package persistent.healthmon.viewcontroller;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;

import persistent.healthmon.R;
import persistent.healthmon.fragments.CarePlanHomeFragment;

public class CarePlanActivity extends AppCompatActivity{

    private FragmentManager fragmentManager;
    private Fragment fragment = new CarePlanHomeFragment();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_care_plan);
        fragmentManager = getSupportFragmentManager();
        changeFragment(fragment);

    }

    public void changeFragment(Fragment fragment){
        FragmentTransaction transaction = fragmentManager.beginTransaction();
        transaction.replace(R.id.careplan_root,fragment);
        transaction.commit();
    }
}
