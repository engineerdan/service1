import logo from './logo.svg';
import './App.css';
import { EventBridgeClient, PutEventsCommand } from "@aws-sdk/client-eventbridge"; // ES Modules import


function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo"/>
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
        >
          Learn React
        </a>
        <button onClick={() => sendEvent("https://bbc.co.uk")}>Send event!</button>
        <button onClick={() => putEvent()}>Put event!</button>
      </header>
    </div>
  );
}

const sendEvent = (url) => {
  window.open(url, "_blank", "noreferrer");
};

// const putEvent = async (
//     source = "eventbridge.integration.test",
//     detailType = "greeting",
//     resources = [],
// ) => {
//   const client = new EventBridgeClient({ region: "eu-west-1" });
//
//   const response = await client.send(
//       new PutEventsCommand({
//         Entries: [
//           {
//             Detail: JSON.stringify({greeting: "Hello there."}),
//             DetailType: detailType,
//             Resources: resources,
//             Source: source,
//           },
//         ],
//       }),
//   );
//   return response;
// }

export default App;
