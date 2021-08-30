const horaire = () => {
  let date = new Date();
  const days = document.querySelectorAll('.day');
  days.forEach((x) => {
    let day = date.getDate();
     if (day < 10) {
       day = `0${day}`;
     }
    let month = date.getMonth() + 1;
    let monthh = ""
     if (month < 10) {
      monthh = `0${month}`;
     }
    let year = date.getFullYear();
    x.title = `${day}-${monthh}-${year}`;
    let nameDay = date.getDay();
    // console.log(nameDay);
    switch (nameDay) {
      case 0:
        nameDay = "Lundi";
        break;
      case 1:
        nameDay = "Mardi";
        break;
      case 2:
        nameDay = "Mercredi";
        break;
      case 3:
        nameDay = "Jeudi";
        break;
      case 4:
        nameDay = "Vendredi";
        break;
      case 5:
        nameDay = "Samedi";
        break;
      case 6:
        nameDay = "Dimanche";
        break;
    }

    switch (month) {
      case 1:
        month = "Janvier";
        break;
      case 2:
        month = "Février";
        break;
      case 3:
        month = "Mars";
        break;
      case 4:
        month = "Avril";
        break;
      case 5:
        month = "Mai";
        break;
      case 6:
        month = "Juin";
        break;
      case 7:
        month = "Juillet";
        break;
      case 8:
        month = "Août";
        break;
      case 9:
        month = "Septembre";
        break;
      case 10:
        month = "Octobre";
        break;
      case 11:
        month = "Novembre";
        break;
      case 12:
        month = "Décembre";
        break;
    }
    // x.innerHTML = `${day}/${month}/${year} - ${month}`;
    x.innerHTML = `${nameDay} ${day} ${month} ${year}`;
    date.setDate(date.getDate() + 1);
  });
}

const crea = () => {
  const btn = document.querySelectorAll('.card-planning');
  btn.forEach((card) => {
    const day = card.querySelector('.day');
    // console.log(day);
    const valeur = day.title.toString();
    // console.log(valeur);
    const sw = card.querySelector('#checkbox');
    // console.log(sw);
    sw.addEventListener(("click"), (event) => {
      if (sw.checked == true) {
        // event.preventDefault();
        const url = 'http://localhost:3000/availabilities';
        fetch(url, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
          body: JSON.stringify({ date: valeur })
        })
          .then(response = response.json())
          .then((data) => {
           console.log("coco");
           data = JSON.parse(data);
           console.log(data);
          })
        // active link



      } else {
        // destroy
        const id = sw.dataset.id;
        const urll = `http://localhost:3000/availabilities/${id}`;
        fetch(urll, {
          method: 'DELETE',
          headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }
        })
          .then(response = response.json())
          .then((data) => {
            console.log(data);
          })
        // disable link
      }
    });
  });
}

export { horaire, crea };
