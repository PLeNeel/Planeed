const scanFunc = () => {
  ScanditSDK.configure("AaZwHxD+MCk1KzUqwAM7/pcLd2ajMNO/Ryhd8u1Fqdy7ByhBQVIETiwQjS6nVy4WNn9bZfwVMNDTbqMGWWrn9RYgArPqQj6BK1+A0/hhAm9VRJke3wCfZ2APEOt1HHTxj0Afs8CwrpIXUzD2rwCiMbp+txxOn/RlydDL1DiumC6ulgdxgs3x9SJt8Pw4zmpntxugNYYsHMKXeRPllCi42440gjknLdV/2AlAIsfprwaCogv4RXztkF1s0m1CAnBi5A9ICD1UbuOhU3TGnUlNQfLQS30xfS9OJe10kFZ9A0zNljdKlnVop6KaNcHmmM28ImTcRsh7MX5tHGtGXAMQrEiOcDQXTQWYcComBKOnoR32wG1pJ38i0KzYDJ88k+INeHoVgUcXPakZ56ZOIOPQ7bg94+NfNT8h7V7MiIvSxN9PNwcysLjYqMsDak8bQqQCv/EsDj3cBb2epHRnhegitTBz+TBA7H7ncdYhTea2uRNqhSgFN1PyJ140DJZPOiP260JrRD8zG0iieA7vkv1CMmiQS5zR0ZMssNWogRiWToeDkcNgE/3GrBWSaP87NSdozXmSvDsLKl40GOi4oRi4TSWOLA4kp9OgkOEXiMtPhjUqPLxfANul3GGbdSJ1LLCW6rB8R6lpS5FfMXzwExv+ArsB9z8CkJofxo3EwIzeVPYeOeVYID1n5oWp2fBnimpts1wiz3WE34hZ6Bjd4qo/2eANaFFxvGOA2LQUK0WcMgDL37CjD0GwK1bAjngBFQjrvj9BNDue6+8ZIJXL99eOrQ5h8NJa06N+xPZYOroqq3ESnJZ2", {
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
