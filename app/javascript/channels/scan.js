const scanFunc = () => {
  ScanditSDK.configure("Ad7wfB//P6H8RazjOSISHog+ONxQFtA3RAUfojg/XH+uQHN/4kJZPQ9Nps0XVEC+Ikpc6EJtDCV0Qk98nnBTKT50TBZuaWGrTSiBvBNSrAgGXV+8SXdj9DMoqjzZJ/mYqRB59QMq06UlaoY1+RK2UakPsNYhnRen2dUczzaTwxqwTT42T3mRyDls2UGl466jhHuHEspWB8XKeG4QkWbfL+yBNRQJGsvM0Eb0qfi0Cp5WWHXSP//5LZA2qD+Aat4OShAbmWphBM+TSUPD2GZa88q3ttindrn2NWFGpGbUFIFoGhBamwbSb1VAirwD2vDswR5lNxvjBJrMjBI6Jn798j/DYdyZSE9fP0CvxsZAsBEi2O0zzifHbFgzbljK+7O29xBcs4dFUzEawjEKfjJkrAi4MG7OilunDXgEVSrnira2YWGFxSmIIjZTnRXGa/Z281VMqt4NlQ7hpNXTwk/ebKAJ+ALWCN+WgEmoW5+ehVSw06bKdzK3ZdpMb1u6GyvTuo0I7fSzi7Zzm+o5p8hy4LolGmyz0yRyNc1SioNWehOWDalBsAyTRLfjXr6HFk0PUugsxE3+afHUjvTxku2OfN/2pZuRl7tRzAVs/g7LfnTXKJP02p8NoZpIvtDd5dGIx2xJE5ZCy/mwF8QNxopzyX8+qFHbvFAkyZ/BF1E8o8Fr+jmZE6HqV6gUtFEsZyfhmLhLVopaKcprcZnP42u6jVWup9Ylv4HhZ2U2FFhPmBBFkjA2UlixhrOkuiBiQKpzocYQSw6FQj6UtHU7Z4EIUAeb1zE3xBbhrp/46j7QKPmCazI7OZ8DZvI=", {
    engineLocation: "https://cdn.jsdelivr.net/npm/scandit-sdk@5.x/build/",
  })
    .then(() => {
      return ScanditSDK.BarcodePicker.create(document.getElementById("scandit-barcode-picker"), {
        // enable some common symbologies
        scanSettings: new ScanditSDK.ScanSettings({ enabledSymbologies: ["ean8", "ean13", "upca", "upce"] }),
      });
    })
    .then((barcodePicker) => {
      // barcodePicker is ready here, show a message every time a barcode is scanned
      barcodePicker.on("scan", (scanResult) => {
        // alert(scanResult.barcodes[0].data);
        const myInput = document.getElementById("scan_barcode");
        const myForm = document.querySelector(".simple_form");
        myInput.value = scanResult.barcodes[0].data;
        myForm.submit();
      });
    });
}

export { scanFunc };
