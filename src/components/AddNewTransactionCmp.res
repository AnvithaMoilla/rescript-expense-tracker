open Types
@react.component
let make = () => {

    let (transaction, setTransaction) = React.useState(() => [])

    React.useEffect0(() => {
    let savedTransaction = JsBindings.getItem("transactions")

    switch Js.Nullable.toOption(savedTransaction) {
    | Some(jsonStr) =>
      let parsed = JsBindings.parseIntoMyData(jsonStr)
      setTransaction(parsed)
    |   None => ()
    }

    None
    });

    React.useEffect1(() => {
        if (Array.length(transaction) > 0) 
        {
            let stringify = JsBindings.stringify(transaction)
            JsBindings.setItem("transactions", stringify);
        }
        None
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
