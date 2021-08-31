const withdraw = () => {
  const toxicCard = document.querySelectorAll('.toxic-card');
  // console.log(toxicCard)
  const minus = document.querySelectorAll('#minus-btn')
  minus.forEach((card) => {
    const  toxicId = card.dataset.id
    // console.log(toxicId)
    const withdrawId = card.dataset.withdrawid
    // console.log(withdrawId)
    let response = ""
    card.addEventListener(("click"), (event) => {
      let newQuantity = card.dataset.quantity
      newQuantity--
      const url = `http://localhost:3000/toxics/${toxicId}/withdraws`;
      fetch(url, {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ quantity: 1, current_quantity: newQuantity, toxic_id: toxicId, withdraw_id: withdrawId })
      })
        .then(response => response.json())
        .then((data) => {
          console.log(data)

        });
    });
  });
  //   card.addEventListener(("click"), (event) => {
  //     const url = `http://localhost:3000/toxics/${toxicId}`;
  //     let newQuantity = card.dataset.quantity
  //     newQuantity--
  //     // console.log(newQuantity)
  //     fetch(url, {
  //       method: 'PATCH',
  //       headers: {
  //         'Accept': 'application/json',
  //         'Content-Type': 'application/json'
  //       },
  //       body: JSON.stringify({current_quantity: newQuantity })
  //     })
  //       .then(response => response.json())
  //       .then((data) => {
  //         console.log(data);
  //       });
  //   });
  // })
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
