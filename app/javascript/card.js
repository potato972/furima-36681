const pay = () => {
  Payjp.setPublicKey("pk_test_8a4d65f21d36a72bec615a53");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("record_destination[number]"),
      exp_month: formData.get("record_destination[exp_month]"),
      exp_year: `20${formData.get("record_destination[exp_year]")}`,
      cvc: formData.get("record_destination[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
  
      document.getElementById("charge-form").submit();
    });
  });
};
window.addEventListener("load", pay);