# AnimatedIcons

<b>Swift Package</b> for using animated icons inside projects without the """stress""" of having to handle the state of every _animated icon_.

## Currently supported:

<details>
<summary><b>Menu Icons:</b></summary>
    <ul>
        <li>
            <details>
                <summary>MoreVert-Cross Animated Icon</summary>Parameters list:
                <ul>
                    <li> <b>isSelected</b>: state handle value </li>
                        <ul>
                            <li> <b>true</b> state -> cross icon </li>
                            <li> <b>false</b> state -> horizontal more dots icon </li>
                        </ul>
                    <li><b>size</b>: icon size </li>
                    <li><b>duration</b>: animation duration </li>
                    <li><b>{dots, cross}color</b>: color for each category in-between <i>{}</i> </li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary>MoreHor-Cross Animated Icon</summary>Parameters list:
                <ul>
                    <li> <b>isSelected</b>: state handle value
                    <ul>
                        <li> <b>true</b> state -> cross icon</li>
                        <li> <b>false</b> state -> horizontal more dots icon</li>
                    </ul>
                    </li>
                    <li> <b>size</b>: icon size </li>
                    <li> <b>duration</b>: animation duration </li>
                    <li> <b>{dots, cross}color</b>: color for each category in-between <i>{}</i> </li>
                </ul>
            </details>
        </li>
        <li>
            <details>
                <summary>Add-Cross Animated Icon</summary>Parameters list:
                <ul>
                <li> <b>isSelected</b>: state handle value:
                    <ul>
                    <li> <b>true</b> state -> cross icon</li>
                    <li> <b>false</b> state -> add icon</li>
                    </ul>
                </li>
                <li> <b>size</b>: icon size </li>
                <li> <b>duration</b>: animation duration</li>
                <li> <b>plusColor</b>: plus icon color</li>
                <li> <b>crossColor</b>: cross icon color</li>
                </ul>
            </details>
        </li>
        <li> 
            <details  >
                <summary>BurgerMenu_Cross Icon</summary>Parameters list:
                <ul>
                    <li> <b>menuState</b>: state handle value
                    <ul>
                        <li> <b>true</b> state -> cross icon</li>
                        <li> <b>false</b> state -> burger icon</li>
                    </ul>
                    </li>
                    <li> <b>size</b>: icon size</li>
                    <li> <b>{burger, cross}Color</b>: color of the specified icon in-between <i>{}</i> </li>
                    <li> <b>duration</b>: animation duration</li>
                    <li> <b>isRounded</b>: rounded line-caps flag</li>
                </ul>
            </details>
        </li>
        <li> 
            <details  >
                <summary>Chevron Rotation Icon</summary>Parameters list:
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
<summary><b>Light/Dark mode icons:</b> </summary>
    <ul>
        <li>
        <details>
            <summary>Sun-Moon icon</summary>Parameters list:
            <ul>
                <li> <b>isSun</b>: state handle value</li>
                <li> <b>size</b>: icon size</li>
                <li> <b>duration</b>: animation duration</li>
                <li> <b>{sun, moon}Color</b>: color of the indicated icon</li>
                <li> <b>sunRayShape</b>: enum value for sun ray shape ( circle, roundedRectangle, triangle)</li>
                <li> <b>bouncy</b>: is the animation bouncy?</li>
            </ul>
        </details>
        </li>
    </ul>
</details>
<details>
    <summary><b>Loading icons:</b></summary>
    <ul>
        <li>
        <details>
            <summary>Spinner:</summary>Parameters list:
            <ul>
                <li> <b>loadingAmount</b>: spinner "drawed" amount (from 10 to 340, degrees format)</li>
                <li> <b>size</b>: icon size</li>
                <li> <b>color</b>: icon color</li>
                <li> <b>ringBackgroundColor</b>: background color of the ring (<i>if needed</i>)</li>
                <li> <b>isRounded</b>: are lineCaps rounded?</li>
                <li> <b>rotationDuration</b>: time in <b>**seconds**</b> of a single rotation</li>
            </ul>
        </details>
        </li>
        <li>
        <details>
            <summary>BouncyDots:</summary>Parameters list:
            <ul>
                <li> <b>size</b>: icon size</li>
                <li> <b>color</b>: icon color</li>
                <li> 
                    <b>dotsShape</b>: shape of the dots, currently supported
                    <ul>
                        <li>circle</li>
                        <li>rectangle</li>
                        <li>roundedRectangle</li>
                        <li>trinangle</li>
                        <li>star</li>
                    </ul>
                </li>
            </ul>
        </details>
        </li>
        <li>
        <details>
            <summary>DisappearingDots:</summary>Parameters list:
            <ul>
                <li> <b>size</b>: icon size</li>
                <li> <b>color</b>: icon color</li>
                <li> 
                    <b>dotsShape</b>: shape of the dots, currently supported
                    <ul>
                        <li>circle</li>
                        <li>rectangle</li>
                        <li>roundedRectangle</li>
                        <li>trinangle</li>
                        <li>star</li>
                    </ul>
                </li>
            </ul>
        </details>
        </li>
        <li>
        <details>
            <summary>MovingDots:</summary>Parameters list:
            <ul>
                <li> <b>size</b>: icon size</li>
                <li> <b>color</b>: icon color</li>
                <li> 
                    <b>dotsShape</b>: shape of the dots, currently supported
                    <ul>
                        <li>circle</li>
                        <li>rectangle</li>
                        <li>roundedRectangle</li>
                        <li>trinangle</li>
                        <li>star</li>
                    </ul>
                </li>
                <li> <b>animationDuration</b>: duration in **seconds** of a single animation iteration </li>
                <li> <b>animationDelay</b>: delay in **seconds** between animation completions</li>
            </ul>
        </details>
        </li>
        <li>
        <details>
            <summary>RotatingDots:</summary>Parameters list:
            <ul>
                <li> <b>size</b>: icon size</li>
                <li> <b>color</b>: icon color</li>
                <li> 
                    <b>dotsShape</b>: shape of the dots, currently supported
                    <ul>
                        <li>circle</li>
                        <li>rectangle</li>
                        <li>roundedRectangle</li>
                        <li>trinangle</li>
                        <li>star</li>
                    </ul>
                </li>
                <li> <b>animationDuration</b>: duration in **seconds** of a single animation iteration </li>
                <li> <b>animationDelay</b>: delay in **seconds** between animation completions</li>
            </ul>
        </details>
        </li>
        <li>
        <details>
            <summary>GrowingDots:</summary>Parameters list:
            <ul>
                <li> <b>size</b>: icon size</li>
                <li> <b>color</b>: icon color</li>
                <li> 
                    <b>dotsShape</b>: shape of the dots, currently supported
                    <ul>
                        <li>circle</li>
                        <li>rectangle</li>
                        <li>roundedRectangle</li>
                        <li>trinangle</li>
                        <li>star</li>
                    </ul>
                </li>
                <li> <b>fromLeftToRight</b>: if the animation goes from left to right, or just outside dots in sync and then inside</li>
                <li> <b>duration</b>: duration in **seconds** of a single animation iteration </li>
            </ul>
        </details>
        </li>
    </ul>
</details>
