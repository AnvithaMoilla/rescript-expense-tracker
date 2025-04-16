@react.component
let make = () => {
  <div className="app-container">
    <h1> {React.string("Expense Tracker")} </h1>
    <AddNewTransactionCmp />
  </div>
}
