window.addEventListener('load',() => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false; }
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
 
  const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1)).toLocaleString();

  const profit = document.getElementById("profit")
    const value_result = (Math.floor(inputValue * 0.1));
    profit.innerHTML = (Math.floor(inputValue - value_result)).toLocaleString();
  })
});