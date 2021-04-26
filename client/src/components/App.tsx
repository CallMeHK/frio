import * as React from 'react'
import Router from '../routes/Router'
import CssBaseline from '@material-ui/core/CssBaseline';
import { ApolloProvider } from '@apollo/client';
import { client } from '../apollo/apolloClient';


const App: React.FC = () => {
	return <ApolloProvider client={client}>
		<CssBaseline />
		<Router />
	</ApolloProvider>
}

export default App
