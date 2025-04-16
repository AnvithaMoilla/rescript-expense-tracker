open Types

@react.component
let make = (~props: array<transaction>) => {
  <div className="history">
    <h4>{React.string("History")}</h4>
    {
      props
      ->Belt.Array.mapWithIndex((index, transaction) => {
        <div
          key={Belt.Int.toString(index)}
          className={
            "history-elements " ++ (transaction.amount > 0 ? "income" : "expense")
          }
        >
          <p>{React.string(transaction.note)}</p>
          <p>{React.string("$" ++ Belt.Int.toString(transaction.amount))}</p>
        </div>
      })
      ->React.array
    }
  </div>
}
