open Types
@react.component
let make = (~props : array<transaction>) => {
  let totalSum = props->Belt.Array.reduce(0, (acc, t) => acc + (t.amount))
  <div className="balance">
    <p>
      <h4> {"Your Balance"->React.string} </h4>
      <h1> {React.string("$" ++ Js.Int.toString(totalSum))} </h1>
    </p>
  </div>
}
