import * as React from 'react';
import { makeStyles, Theme } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';
import { css } from '@emotion/css'
import { useHistory, useLocation } from 'react-router-dom'

interface TabPanelProps {
    children?: React.ReactNode;
    index: any;
    value: any;
}

function TabPanel(props: TabPanelProps) {
    const { children, value, index, ...other } = props;

    return (
        <div
            role="tabpanel"
            hidden={value !== index}
            id={`simple-tabpanel-${index}`}
            aria-labelledby={`simple-tab-${index}`}
            {...other}
        >
            {value === index && (
                <Box p={3}>
                    <Typography>{children}</Typography>
                </Box>
            )}
        </div>
    );
}

const appContainerStyle = css({
    flexGrow: 1
})

const routeList = { "/": 0, "/search": 0, "/map": 1, }

export default function SimpleTabs({ children }) {
    const history = useHistory()
    const location = useLocation()

    console.log(location.pathname)
    const [value, setValue] = React.useState(routeList[location.pathname] || 0);

    const handleChange = (event: React.ChangeEvent<{}>, newValue: number) => {
        setValue(newValue);
        history.push(["/search", "/map"][newValue])
    };

    return (
        <div className={appContainerStyle}>
            <AppBar position="static">
                <Tabs value={value} onChange={handleChange} aria-label="simple tabs example">
                    <Tab label="Search" />
                    <Tab label="Map" />
                </Tabs>
            </AppBar>
            {children}
        </div>
    );
}