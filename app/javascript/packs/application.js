// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { horaire } from "../channels/availability";
import { crea } from "../channels/availability";
import { withdraw } from "../channels/toxic";
import { collapsed } from "../channels/collapse";
import { initChatroomCable } from "../channels/chatroom_channel";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  horaire();
  crea();
  withdraw();
  collapsed();

  initChatroomCable();

  ScanditSDK.configure("AT8A0jT+FJrUFhS1XTJ2DrwxLIDzEbMnVxdtT6V7YZAkEdcAqiZfgv8+jtwWY7Z5SWkfgy19a8AZS/7mEW/5rG1VBXl8U7u2Lk3nhMlOQ/GyQNKtTkLu/70uHT5LRlus0N4sY6nCPWKEFGAKiUNvUUrg8v2eZnx6xZpCQxn7MObHYHLL2Pxw1OVCVaQEJHuRUzwqthC1VCQ2dS7CrejpUJppUd1Lz9moVm5jZOZyCxfQQlskuY0W1xyD5Q9X8z9oXGIB3qoWAPhrfcnJq+vSk6mp3+cGMF/O24PfR0a9tXyWDwE80nSS7PtDsbkQopGW0Kv7uszsRxl6HJYAAc66tDGqxmlKQEbdtCDadKI2YJD21ijNh3jezYtrBw7IHNXuxgPuuY659YwWZEuz9CO0+vdWqQI56i0Jpb0srHY60SNG3GHVeOE1aMDA2dKShbP19y3bzeRyU2nPQ6Pb3DtmoiVoZtJIf1Slsr7DyxBD4g2fpFh7uTkj8azr0o7nDqZUe03EbIp+SJboUMtzc9jQsAV1rPIv7gXJlvvvhjHm0NgrqPAtTmZkutqVEvr5tPTH8qqByx5ye10SRqnnN66SHEH/p7FbPu8cVJE9C1GUFhDlhFGtjJaMG5F726+NhmAoZg2pqmtZF2uYea8DRpRRCDABK8USfc+W96nsfgL+emjxqDHzOrIAygX2/gx88CdjlC8z4sipwIgEreZWi5CO2P/klVEeAso/YjtrJedzCO9xdi8ygJsE8o0rdtETToH1D5tuRJaMyYd+w24ADW2Y++Od47gG1TgK/0D3udYsnw==", {
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
});
