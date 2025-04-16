open Types
@react.component
let make = (~props : array<transaction>) => {
  let (income, expense) =
  props->Belt.Array.reduce((0, 0), ((i, e), t) =>
    if (t.amount) > 0 {
      (i + (t.amount), e)
    } else {
      (i, e + (t.amount))
    }
  )

  <div className="income-expense">
    <div className="income-expense-cell" id="income">
      <p> {React.string("Income")} </p>
      <p> {React.string("$" ++ Js.Int.toString(income))} </p>
    </div>
    <div className="income-expense-divider" />
    <div className="income-expense-cell" id="expense">
      <p> {React.string("Expenses")} </p>
      <p> {React.string("$" ++ Js.Int.toString(-expense))} </p>
    </div>
  </div>
}
