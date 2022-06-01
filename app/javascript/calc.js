function calc() {
 const Price = document.getElementById("item-price");
 Price.addEventListener("input",() => {
  const Fee = Math.floor(Price.value * 0.1);
  const Profit = Price.value - Fee;
  const FeeView = document.getElementById("add-tax-price");
  FeeView.innerHTML = `${Fee}`;
  const ProfitView = document.getElementById("profit");
  ProfitView.innerHTML = `${Profit}`;
 });
};
addEventListener("load",calc);