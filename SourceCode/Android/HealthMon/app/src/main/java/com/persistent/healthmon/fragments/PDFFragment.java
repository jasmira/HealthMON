package com.persistent.healthmon.fragments;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.github.barteksc.pdfviewer.PDFView;
import com.github.barteksc.pdfviewer.listener.OnLoadCompleteListener;
import com.github.barteksc.pdfviewer.scroll.DefaultScrollHandle;
import com.persistent.healthmon.R;
import com.shockwave.pdfium.PdfDocument;

import java.util.List;

/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link PDFFragment.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link PDFFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class PDFFragment extends BaseFragment {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;
    private String pdfFileName;
    PDFView pdfView;

    private OnFragmentInteractionListener mListener;

    public PDFFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment PDFFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static PDFFragment newInstance(String param1, String param2) {
        PDFFragment fragment = new PDFFragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {

            pdfFileName=getArguments().getString("pdf");
        }
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view=inflater.inflate(R.layout.fragment_pdf, container, false);
        pdfView=(PDFView) view.findViewById(R.id.pdfView);
        pdfView.fromAsset(pdfFileName).onLoad(new OnLoadCompleteListener() {
            @Override
            public void loadComplete(int nbPages) {
               /* PdfDocument.Meta meta = pdfView.getDocumentMeta();
                Log.e(TAG, "title = " + meta.getTitle());
                Log.e(TAG, "author = " + meta.getAuthor());
                Log.e(TAG, "subject = " + meta.getSubject());
                Log.e(TAG, "keywords = " + meta.getKeywords());
                Log.e(TAG, "creator = " + meta.getCreator());
                Log.e(TAG, "producer = " + meta.getProducer());
                Log.e(TAG, "creationDate = " + meta.getCreationDate());
                Log.e(TAG, "modDate = " + meta.getModDate());*/

                printBookmarksTree(pdfView.getTableOfContents(), "-");
            }
        })
                .scrollHandle(new DefaultScrollHandle(getActivity()))
                .load();;
        // Inflate the layout for this fragment
        return  view;
    }
    public void printBookmarksTree(List<PdfDocument.Bookmark> tree, String sep) {
        for (PdfDocument.Bookmark b : tree) {

            //Log.e(TAG, String.format("%s %s, p %d", sep, b.getTitle(), b.getPageIdx()));

            if (b.hasChildren()) {
                printBookmarksTree(b.getChildren(), sep + "-");
            }
        }
    }

    // TODO: Rename method, update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
       /* if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
        } else {
            throw new RuntimeException(context.toString()
                    + " must implement OnFragmentInteractionListener");
        }*/
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    /**
     * This interface must be implemented by activities that contain this
     * fragment to allow an interaction in this fragment to be communicated
     * to the activity and potentially other fragments contained in that
     * activity.
     * <p>
     * See the Android Training lesson <a href=
     * "http://developer.android.com/training/basics/fragments/communicating.html"
     * >Communicating with Other Fragments</a> for more information.
     */
    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        void onFragmentInteraction(Uri uri);
    }
}
