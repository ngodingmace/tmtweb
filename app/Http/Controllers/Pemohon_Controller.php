<?php

namespace App\Http\Controllers;

use App\Models\Pemohon;
use Illuminate\Http\Request;

class Pemohon_Controller extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $jumlahData = Pemohon::count(); // Menghitung jumlah data dalam tabel pemohon
        return view('admin.index',compact('jumlahData'));
    }

    public function dataPemohon(Request $request)
        {
            $nominalOptions = [
                500000 => 'Rp.500.000',
                800000 => 'Rp.800.000',
                1000000 => 'Rp.1.000.000',
                1500000 => 'Rp.1.500.000',
                2000000 => 'Rp.2.000.000',
            ];

            $selectedNominal = (int)$request->input('nominalPermohonan');
            $biayaAdministrasi = 25000;
            $pencairanTahap1 = 0;
            $pencairanTahap2 = 0;
            $totalDiterima = 0;

            // Hitung nilai-nilai berdasarkan pilihan nominal
            if ($selectedNominal === 500000) {
                $pencairanTahap1 = $selectedNominal - $biayaAdministrasi;
                $totalDiterima = $pencairanTahap1;
            } elseif ($selectedNominal === 800000) {
                $pencairanTahap1 = $selectedNominal - $biayaAdministrasi;
                $totalDiterima = $pencairanTahap1;
            } elseif ($selectedNominal === 1000000) {
                $pencairanTahap1 = ($selectedNominal - $biayaAdministrasi) / 2;
                $pencairanTahap2 = $pencairanTahap1;
                $totalDiterima = $pencairanTahap1 + $pencairanTahap2;
            } elseif ($selectedNominal === 1500000) {
                $pencairanTahap1 = ($selectedNominal - $biayaAdministrasi) / 2;
                $pencairanTahap2 = $pencairanTahap1;
                $totalDiterima = $pencairanTahap1 + $pencairanTahap2;
            } elseif ($selectedNominal === 2000000) {
                $pencairanTahap1 = ($selectedNominal - $biayaAdministrasi) / 2;
                $pencairanTahap2 = $pencairanTahap1;
                $totalDiterima = $pencairanTahap1 + $pencairanTahap2;
            }

            return view('admin.dataPemohon', [
                'nominalOptions' => $nominalOptions,
                'selectedNominal' => $selectedNominal,
                'pencairanTahap1' => $pencairanTahap1,
                'pencairanTahap2' => $pencairanTahap2,
                'totalDiterima' => $totalDiterima,
            ]);
        }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Pemohon $pemohon)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Pemohon $pemohon)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        // Temukan data Admin berdasarkan ID
        $admin = Pemohon::findOrFail($id);

        try {
            //code...
            $admin->update([
                'name' => $request->input('name'),
                'tempat_lahir' => $request->input('tempat_lahir'),
                'dob' => $request->input('dob'),
                'area' => $request->input('area'),
                'noSC' => $request->input('noSC'),
                'noKTP' => $request->input('noKTP'),
                'agency' => $request->input('agency'),
                'namaAtasan' => $request->input('namaAtasan'),
                'noTelpAtasan' => $request->input('noTelpAtasan'),
                'sales_active' => $request->input('sales_active'),
                'sales_order' => $request->input('sales_order'),
                'nominalPermohonan' => $request->input('nominalPermohonan'),
            ]);

            // Hitung ulang pencairan tahap 1, pencairan tahap 2, dan total diterima berdasarkan nominal yang baru
            $biayaAdministrasi = 25000;
            $selectedNominal = (int)$request->input('nominalPermohonan');

            if ($selectedNominal === 500000) {
                $pencairanTahap1 = $selectedNominal;
                $pencairanTahap2 = 0;
                $totalDiterima = $selectedNominal - $biayaAdministrasi;
            } elseif ($selectedNominal === 800000) {
                $pencairanTahap1 = $selectedNominal;
                $pencairanTahap2 = 0;
                $totalDiterima = $selectedNominal - $biayaAdministrasi;
            } elseif ($selectedNominal === 1500000) {
                $pencairanTahap1 = 800000;
                $pencairanTahap2 = 700000;
                $totalDiterima = $selectedNominal - $biayaAdministrasi * 2;
            } else { // Anda bisa menggunakan elseif untuk kasus lain jika diperlukan
                $pencairanTahap1 =  $selectedNominal / 2;
                $pencairanTahap2 =  $selectedNominal / 2;
                $totalDiterima = $selectedNominal - $biayaAdministrasi * 2;
            }

            $pencairanTahap1Formatted = 'Rp. ' . number_format($pencairanTahap1);
            $pencairanTahap2Formatted = 'Rp. ' . number_format($pencairanTahap2);
            $totalDiterimaFormatted = 'Rp. ' . number_format($totalDiterima);

            $admin->update([
                'pencairanTahap1' => $pencairanTahap1Formatted,
                'pencairanTahap2' => $pencairanTahap2Formatted,
                'totalDiterima' => $totalDiterimaFormatted,
            ]);
            // Show a success Toastr notification

            return response()->json([
                'status' => true,
                'message' => 'Data has been updated successfully'
            ]);

        } catch (\Throwable $th) {
            // Show an error Toastr notification
            return response()->json([
                'status' => false,
                'message' => 'Data update failed'
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $admin = Pemohon::findOrFail($id); // Find the admin data by ID

        if ($admin->delete()) {
            $message = 'data telah dihapus.';
            $status = true;
        } else {
            $message = 'Gagal menghapus.';
            $status = false;
        }

        return response()->json([
            'status' => $status,
            'message' => $message,
        ]);
    }

    public function getAdminData($id)
    {
        $admin = Pemohon::findOrFail($id);
        return response()->json($admin);
    }
}
