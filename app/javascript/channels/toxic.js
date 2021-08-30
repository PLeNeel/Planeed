const withdraw = () => {
  const toxicCard = document.querySelectorAll('.toxic-card');
  // console.log(toxicCard)
  const minus = document.querySelectorAll('#minus-btn')
  minus.forEach((card) => {
    const  toxicId = card.dataset.id
    console.log(toxicId)
    card.addEventListener(("click"), (event) => {
      const url = `http://localhost:3000/toxics/${toxicId}/withdraws`;
      fetch(url, {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ toxic_id: toxicId, quantity: 1})
      })
        .then(response = response.json())
        .then((data) => {
          console.log(data);
        });
    });
  })
  // toxicCard.forEach((card) => {
  //   // console.log(card)
  //   const nameCard = card.querySelector('.toxic-name');
  //   const name = nameCard.dataset.toxicname;
  //   // console.log(name);
  //   const service = document.getElementById('minus-btn')

  //   // console.log(minus)
  //   const serviceId = service.dataset.id
  //   // console.log(serviceId)
  //   minus.addEventListener(("click"), (event) => {
  //     const url = `http://localhost:3000/toxics/:toxic_id/withdraws`;
  //     fetch(url, {
  //       method: 'POST',
  //       headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
  //       body: JSON.stringify({ name: name })
  //     })
  //       .then(response = response.json())
  //       .then((data) => {
  //         // console.log(data);
  //       });
  //   });
  // });
}

export { withdraw };
