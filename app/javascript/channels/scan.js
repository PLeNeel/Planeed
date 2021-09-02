const scanFunc = () => {
  ScanditSDK.configure("AUqw2jf+Fy1TGIN53gKlgV8h39u5OGnoAAh6oZdOg18UG6erz256hdIZczN9Y8wW72dI7qwzoGQ/ViLfbH8ozVxS7CMVWxpHnieilS1jgu/4IAEYRE9O9McObsDiJ0Je2jR6tOMZAyzYLn1zO1JiR8p+XQfGEEV/Neoi5m3RRmojxSg47m8NLRW4TXr6VDGqf8J6Mu3NqRc0cbZcLRssDqAoBM6bxPBWe8LUW7c+KEuvRN/kTrM3jcl/OwXVYWHBoWrHFXHX0ZiwYfTw5JBsQh77yHPXErD7f8A1aCjaVZ5vhdFCdI8XEblzf1DswWZBcA4WCcLMee3pxkCApBDQLnAmDL44e86Z55jzyb/2ZRrXraKSrfBm+1QTnEfS20sqmkS2eZP6cgLyMpYbBHNBDSoeT1hEsKgg7v82sbW/I1O94YCxP+v55ODpvD0IoxHatKYWZcy4Ia8vdOxB9hy6qz3Pn2kHEF9GKuI4KXYRkknobk4pN+bMnmEudvtwKtceNQudrybS0eZlOMHs67X946AQHlIsKIDLj5IfkzpXR0Kl5xZaO+pZaEdJ3ZFfrcQivAwiR5Iqx47B33UOFcL0xj3tOOW/5Ig+yRstd4CzyhWQO80iBJScVh1olrdTV05bRRoVUloXgrbouLcmJMKC3RxjOtgsIcKOkkSnxMg3o6N7maGIOTa4yNA9DmycpLj95UHw+ynmao4JFGWcC1UqOQ+f4XfAjZdShltpwBiN5G952hcIoNXJ2P79uI3w2Wmazm67erimK/PZuXHtd/QD1e6qnEtmBaev/QAfDpvJ4JIlEVjYLmbJABU=www.planneed.live", {
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
