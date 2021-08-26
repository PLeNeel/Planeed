const horaire = () => {
  let date = new Date();
  const days = document.querySelectorAll('.day');
  days.forEach((x) => {
    let day = date.getDate();
     if (day < 10) {
       day = `0${day}`;
     }
    let month = date.getMonth() + 1;
     if (month < 10) {
       month = `0${month}`;
     }
    let year = date.getFullYear();
    let nameDay = date.getDay();
    console.log(nameDay);
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
    x.innerHTML = `${day}/${month}/${year} - ${nameDay}`;
    date.setDate(date.getDate() + 1);
  });
}

export { horaire };
