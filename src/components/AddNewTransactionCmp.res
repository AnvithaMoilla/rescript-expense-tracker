open Types
@react.component
let make = () => {

    let (transaction, setTransaction) = React.useState(() => [])

     React.useEffect(() => {
    let savedTransactions = JsBindings.getItem("transactions");

    let savedTransactionsTemp = switch Js.Nullable.toOption(savedTransactions) {
        | Some(value) => value
        | None => ""
    };

    None
    }, []);

    React.useEffect1(() => {
  if (transaction->Js.Array.length > 0) {

    let jsonArray: Js.Json.t =
      transaction
      ->Belt.Array.map(element =>

        Js.Json.object_(Js.Dict.empty())
      )
      ->Js.Json.array;
    
    JsBindings.setItem("transactions", JsBindings.stringify(jsonArray));
  }
  None;
}, [transaction]);

    let addDetails = (event) => {
        ReactEvent.Form.preventDefault(event)

        let newNote: string = ReactEvent.Form.target(event)["note"]["value"]
        let newAmount: int = int_of_string(ReactEvent.Form.target(event)["amount"]["value"])

        let newTransaction = {
            note : newNote,
            amount : newAmount
        }

        setTransaction(prev => Js.Array.concat(prev, [newTransaction]))
    }

        <>
        <BalanceTrackerCmp props={transaction}/>
        <IncomeExpenseCmp props={transaction}/>

        
  <form className="input-details" onSubmit={e => addDetails(e)}>
    <h4> {React.string("Add New Transaction")} </h4>

    <label> {React.string("Text")} </label>
    <br />
    <input
      id="note"
      type_="text"
      placeholder="Enter Text..."

    />
    <br />
    <label> {React.string("Amount")} </label>
    <br />
    <input
      id="amount"
      type_="number"
      placeholder="Enter Amount..."
    />
    <br />
    <br />
    <button type_="submit" id="transaction-btn">
      {React.string("Add Transaction")}
    </button>
  </form>
        <HistoryCmp props={transaction}/>
        </>
}
