*** Settings ***
Library    AppiumLibrary
Library    Collections
Library    BuiltIn
*** Keywords ***
Open App
    [Documentation]    Buka aplikasi di device menggunakan package tanpa APK
    Open Application    http://127.0.0.1:4723
    ...    platformName=Android
    ...    deviceName=emulator-5554
    ...    automationName=UiAutomator2
    ...    appPackage=com.lionparcel.services.consumer
    ...    noReset=${True}
    Set Appium Timeout    30 seconds


Close App
    [Documentation]    Tutup aplikasi
    Close Application

Reset App
    [Documentation]    Reset aplikasi sebelum tiap test case
    Reset Application

User Berada di Halaman Cek Tarif
    [Documentation]    Navigasi ke halaman Cek Tarif
    Wait Until Page Contains Element    //android.widget.TextView[@text='Cek Tarif untuk Pengirimanmu']    timeout=10s

 User Memasukkan Kota Asal
    [Arguments]    ${asal}
    Click Element    //android.widget.EditText[@text='Sukawangi, Bekasi (CIK)']       
    Wait Until Page Contains Element   //android.widget.EditText[@text='Cari Kecamatan']     timeout=2s
    Click Element    //android.widget.EditText[@text='Cari Kecamatan']    
    Input Text    //android.widget.EditText[@text='Cari Kecamatan']    ${asal}
    Click Element    //android.widget.TextView[@text='Babelan, Bekasi (BKA)']

 User Memasukkan Kota Tujuan
    [Arguments]    ${tujuan}
    Click Element    //android.widget.EditText[@text='Tujuan (Nasional & Internasional)'] 
    Wait Until Page Contains Element   //android.widget.EditText[@text='Cari Kecamatan']     timeout=2s
    Input Text    //android.widget.EditText[@text='Cari Kecamatan']    ${tujuan}
    Click Element    //android.widget.TextView[@text='Kembangan']

 User Menekan Tombol Cek Tarif
    Wait Until Page Contains Element   //android.widget.Button[@text='Cek Tarif']     timeout=2s
    Click Element  //android.widget.Button[@text='Cek Tarif']

 User Memasukkan Berat Paket
    [Arguments]    ${berat}
    Input Text   //*[@class = 'android.widget.EditText' and @resource-id = 'com.lionparcel.services.consumer:id/edtTotalWeight']    ${berat}

User Memasukkan Dimensi Panjang
    [Arguments]    ${panjang}
    Input Text    //*[@class = 'android.widget.EditText' and @resource-id = 'com.lionparcel.services.consumer:id/edtDimensionLong']   ${panjang}

User Memasukkan Dimensi Lebar
    [Arguments]    ${lebar}
    Input Text    //*[@class = 'android.widget.EditText' and @resource-id = 'com.lionparcel.services.consumer:id/edtDimensionWide']    ${lebar}

User Memasukkan Dimensi Tinggi
    [Arguments]    ${tinggi}
    Input Text    //*[@class = 'android.widget.EditText' and @resource-id = 'com.lionparcel.services.consumer:id/edtDimensionHeight']    ${tinggi}

User Memasukkan Jenis Barang
    [Arguments]    ${barang}
    Input Text    //*[@class = 'android.widget.EditText' and (@text = 'Masukkan jenis barangmu')]    ${barang}

User Masukkan Asuransi Nilai Barang
    [Arguments]    ${harga_barang}
     Wait Until Page Contains Element  //*[@class = 'android.widget.EditText' and @resource-id = 'com.lionparcel.services.consumer:id/edtInsurancePrice']     timeout=5s
    Input Text    //*[@class = 'android.widget.EditText' and @resource-id = 'com.lionparcel.services.consumer:id/edtInsurancePrice']   ${harga_barang}

Sistem Menampilkan Tarif Pengiriman
    [Arguments]    ${expected_result}  
    Wait Until Page Contains Element  //*[@class = 'android.widget.TextView' and @resource-id = 'com.lionparcel.services.consumer:id/txtTotalTariffEstimation']     timeout=10s
    ${actual_result}=    Get Text   //*[@class = 'android.widget.TextView' and @resource-id = 'com.lionparcel.services.consumer:id/txtTotalTariffEstimation']
    Should Be Equal As Strings    ${expected_result}    ${actual_result}