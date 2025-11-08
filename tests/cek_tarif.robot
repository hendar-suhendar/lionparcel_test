*** Settings ***
Documentation     Test case untuk fitur Cek Tarif di aplikasi Lion Parcel
Resource          ../resources/keywords.robot
Suite Setup       Open App
Suite Teardown    Close App

*** Variables ***
${asal_valid}     Babelan, Bekasi
${tujuan_valid}   Jakarta Barat
${berat_valid}    3.2
${panjang_valid}    40
${lebar_valid}    30
${tinggi_valid}    5
${jenis_barang}    (DG) Laptop
${harga_barang}    20000000
${ex_result}    Rp8.250

*** Test Cases ***
Cek Tarif Dengan Input Valid
    [Documentation]    Positive test case: input valid
    User Berada di Halaman Cek Tarif
    User Memasukkan Kota Asal    ${asal_valid}
    User Memasukkan Kota Tujuan  ${tujuan_valid}
    User menekan Tombol Cek Tarif 
    User Memasukkan Berat Paket  ${berat_valid}
    User Memasukkan Dimensi Panjang  ${panjang_valid}
    User Memasukkan Dimensi Lebar  ${lebar_valid} 
    User Memasukkan Dimensi Tinggi  ${tinggi_valid}
    User Memasukkan Jenis Barang   ${jenis_barang}
    User Masukkan Asuransi Nilai Barang   ${harga_barang}
    Sistem Menampilkan Tarif Pengiriman    ${ex_result}
