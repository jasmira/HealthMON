package persistent.healthmon.adapter;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;

import java.util.ArrayList;

import persistent.healthmon.fragments.DashboardPatientListFragment;
import persistent.healthmon.model.DocPatientInfo;

/**
 * Created by khyati_shah on 6/15/2016.
 */
public class DocPatientListPagerAdapter extends FragmentPagerAdapter {

    ArrayList<DocPatientInfo> docPatientInfos;

    public DocPatientListPagerAdapter(FragmentManager fm, ArrayList<DocPatientInfo> docPatientInfos) {
        super(fm);
        this.docPatientInfos = docPatientInfos;
    }

    @Override
    public Fragment getItem(int position) {
        return new DashboardPatientListFragment(docPatientInfos.get(position));
    }

    @Override
    public int getCount() {
        return docPatientInfos.size();
    }

    // Returns the page title for the top indicator
    @Override
    public CharSequence getPageTitle(int position) {
        return docPatientInfos.get(position).getDocName() + "'s Appointments";
    }
}
