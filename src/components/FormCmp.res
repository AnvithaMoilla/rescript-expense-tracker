@react.component
let make = (~onSubmit: ReactEvent.Form.t => unit) => {
  <form className="input-details" onSubmit={onSubmit}>
    <h4> {React.string("Add New Transaction")} </h4>

    <label> {React.string("Text")} </label>
    <br />
    <input id="note" type_="text" placeholder="Enter Text..." />
    <br />

    <label> {React.string("Amount")} </label>
    <br />
    <input id="amount" type_="number" placeholder="Enter Amount..." />
    <br />
    <br />

    <button type_="submit" id="transaction-btn">
      {React.string("Add Transaction")}
    </button>
  </form>
}
