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
        <AddTransactionForm onSubmit={addDetails} />
        <HistoryCmp props={transaction}/>
        </>
}
