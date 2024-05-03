import { useContext } from "react"
import { AuthContext } from "./AuthContext"
import {EventBridgeClient, PutEventsCommand} from "@aws-sdk/client-eventbridge";
import {fromCognitoIdentityPool} from "@aws-sdk/credential-providers";
import {getSession} from "./auth";

export default function UserProfile() {
    const { user, signOut } = useContext(AuthContext)

    return (
        <div>
            {user && (
                <div>
                    <h2>User Profile</h2>
                    <p>Username: {user.username}</p>
                    <p>Email: {user.email}</p>
                    {/* Display any other user data here */}
                </div>
            )}
            <button onClick={() => putEvent()}>Put event!</button>
            <button onClick={signOut}>Sign Out</button>
        </div>
    )
}

const putEvent = async (
    source = "eventbridge.integration.test",
    detailType = "testtype",
    resources = [],
) => {
    const session = await getSession()
    let idToken = session.getIdToken().getJwtToken()
    let COGNITO_ID = process.env.REACT_APP_COGNITO_ID
    let loginData = {
        [COGNITO_ID]: idToken,
    };
    console.log(loginData)
    const client = new EventBridgeClient({
        region: process.env.REACT_APP_REGION,
        credentials: fromCognitoIdentityPool({
            clientConfig: {region: process.env.REACT_APP_REGION}, // Configure the underlying CognitoIdentityClient.
            identityPoolId: process.env.REACT_APP_IDENTITY_POOL,
            logins: loginData
        })
    });
    const response = await client.send(
      new PutEventsCommand({
        Entries: [
          {
            Detail: JSON.stringify({greeting: "Another message."}),
            DetailType: detailType,
            Resources: resources,
            Source: source,
          },
        ],
      }),
    );
    console.log(response)
  return response;
}