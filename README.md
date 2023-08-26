# AnimatedIcons

<b>Swift Package</b> for using animated icons inside projects without the """stress""" of having to handle the state of every _animated icon_.

## Currently supported:

<details>
<summary>Menu Icons:</summary>
    <ul>
        <li>
            <details>
                <summary><b>MoreVert-Cross Animated Icon</b></summary>Parameters list:
                <ul>
                    <li> <b>isSelected</b>: state handle value </li>
                        <ul>
                            <li> <b>true</b> state -> cross icon </li>
                            <li> <b>false</b> state -> horizontal more dots icon </li>
                        </ul>
                    <li><b>size</b>: icon size </li>
                    <li><b>duration</b>: animation duration </li>
                    <li><b>{dots, cross}color</b>: color for each category in-between _{}_ </li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary><b>MoreHor-Cross Animated Icon</b></summary>Parameters list:
                <ul>
                    <li> <b>isSelected</b>: state handle value
                    <ul>
                        <li> <b>true</b> state -> cross icon</li>
                        <li> <b>false</b> state -> horizontal more dots icon</li>
                    </ul>
                    </li>
                    <li> <b>size</b>: icon size </li>
                    <li> <b>duration</b>: animation duration </li>
                    <li> <b>{dots, cross}color</b>: color for each category in-between _{}_ </li>
                </ul>
            </details>
        </li>
        <li>
            <details  >
                <summary><b>Add-Cross Animated Icon</b></summary>Parameters list:
                <ul>
                <li> <b>isSelected</b>: state handle value:
                    <ul>
                    <li> <b>true</b> state -> cross icon</li>
                    <li> <b>false</b> state -> add icon</li>
                    </ul>
                </li>
                <li> <b>size</b>: icon size </li>
                <li> <b>duration</b>: animation duration</li>
                <li> <b>plusColor<b> : plus icon color</li>
                <li> <b>crossColor<b> : cross icon color</li>
                </ul>
            </details>
        </li>
        <li> 
            <details  >
                <summary><b>BurgerMenu_Cross Icon</b></summary>Parameters list:
                <ul>
                    <li> <b>menuState</b>: state handle value
                    <ul>
                        <li> <b>true</b> state -> cross icon</li>
                        <li> <b>false</b> state -> burger icon</li>
                    </ul>
                    </li>
                    <li> <b>size</b>: icon size</li>
                    <li> <b>{burger, cross}Color</b>: color of the specified icon in-between _{}_ </li>
                    <li> <b>duration</b>: animation duration</li>
                    <li> <b>isRounded</b>: rounded line-caps flag</li>
                </ul>
            </details>
        </li>
        <li> 
            <details  >
                <summary><b>Chevron Rotation Icon</b></summary>Parameters list:
                <ul>
                    <li> <b>isSelected</b>: state handle value</li>
                    <li> <b>size</b>: icon size</li>
                    <li> <b>duration</b>: animation duration</li>
                    <li> <b>from</b>: starting rotation of the chevron</li>
                </ul>
            </details>
        </li>
    </ul>
</details>
<details>
<summary> Light/Dark mode icons:</summary>
    <ul>
        <li>
        <details>
            <summary><b>Sun-Moon icon</b></summary>Parameters list:
            <ul>
                <li> <b>isSun</b>: state handle value</li>
                <li> <b>size</b>: icon size</li>
                <li> <b>duration</b>: animation duration</li>
                <li> <b>{sun, moon}Color</b>: color of the indicated icon</li>
            </ul>
        </details>
        </li>
    </ul>
</details>
<details>
    <summary>Loading icons:</summary>
    <ul>
        <li>
        <details>
            <summary><b>LoadingSpinner animation:</b></summary>Parameters list:
            <ul>
                <li> <b>loadingAmount</b>: spinner "drawed" amount (from 0 to 360)</li>
                <li> <b>size</b>: icon size</li>
                <li> <b>color</b>: icon color</li>
                <li> <b>isRounded</b>: are lineCaps rounded?</li>
                <li> <b>rotationSpeed</b>: multiplicative constant for animation speed management</li>
            </ul>
        </details>
        </li>
    </ul>
</details>
