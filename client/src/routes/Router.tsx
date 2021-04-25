import * as React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";

const Router: React.FC = () =>  {
  return (
    <Router>
      <div>
        <nav>
          <ul>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/about">About</Link>
            </li>
            <li>
              <Link to="/users">Users</Link>
            </li>
          </ul>
        </nav>

        {/* A <Switch> looks through its children <Route>s and
            renders the first one that matches the current URL. */}
        <Switch>
          <Route path="/about">
						<div>about</div>
          </Route>
          <Route path="/users">
						<div>users</div>
          </Route>
          <Route path="/">
						<div>home</div>
          </Route>
        </Switch>
      </div>
    </Router>
  );
}

export default Router
