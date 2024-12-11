const priceCalculation = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profitElement = document.getElementById("profit");

  if (!priceInput) return; // priceInputが存在しない場合は終了

  priceInput.addEventListener("input", () => {
    const inputValue = Number(priceInput.value);
    if (isNaN(inputValue) || inputValue <= 0) {
      addTaxPrice.textContent = "0";
      profitElement.textContent = "0";
      return;
    }
    const taxPrice = Math.floor(inputValue * 0.1);
    const profit = inputValue - taxPrice;
    addTaxPrice.textContent = `${taxPrice}`;
    profitElement.textContent = `${profit}`;
  });
};

window.addEventListener("turbo:load", priceCalculation);
window.addEventListener("turbo:render", priceCalculation);
