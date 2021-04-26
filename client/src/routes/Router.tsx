import * as React from "react";
import {
  BrowserRouter,
  Switch,
  Route,
  Link,
  Redirect
} from "react-router-dom";
import TabNav from '../components/layout/TabNav'
import FreezerView from "./Map/FreezerView";

const Router: React.FC = () => {
  return (
    <BrowserRouter>
      <div>
        <TabNav>
          <Switch>
            <Route exact path="/">
              <Redirect to="/search" />
            </Route>
            <Route path="/search">
              <div>search</div>
            </Route>
            <Route path={["/map", "/map/:freezer"]}>
              <FreezerView />
            </Route>
          </Switch>
        </ TabNav>
      </div>
    </BrowserRouter>
  );
}

export default Router
