import React, { useState, useEffect } from "react";
import Link from "next/link";
import { MENUITEMS } from "../../constant/menu";
import { Container, Row } from "reactstrap";
import { useTranslation } from "react-i18next";
import { useRouter } from "next/router";
import { fecthAllCategories } from "../../../services/Categories.Services";

const NavBar = () => {
  const { t } = useTranslation();
  const [navClose, setNavClose] = useState({ right: "0px" });
  const router = useRouter();


  const openNav = () => {
    setNavClose({ right: "0px" });
    if (router.asPath == "/layouts/Gym")
      document.querySelector("#topHeader").classList.add("zindex-class");
  };

  const closeNav = () => {
    setNavClose({ right: "-410px" });
    if (router.asPath == "/layouts/Gym")
      document.querySelector("#topHeader").classList.remove("zindex-class");
  };
  // eslint-disable-next-line


  // Click Toggle menu
  const toggletNavActive = (item) => {
    if (!item.active) {
      MENUITEMS.forEach((a) => {
        if (MENUITEMS.includes(item)) a.active = false;
        if (!a.children) return false;
        a.children.forEach((b) => {
          if (a.children.includes(item)) {
            b.active = false;
          }
          if (!b.children) return false;
          b.children.forEach((c) => {
            if (b.children.includes(item)) {
              c.active = false;
            }
          });
        });
      });
    }
    item.active = !item.active;
    setMainMenu({ mainmenu: MENUITEMS });
  };

  const openMblNav = (event) => {
    if (event.target.classList.contains("sub-arrow")) return;

    if (event.target.nextElementSibling.classList.contains("opensubmenu"))
      event.target.nextElementSibling.classList.remove("opensubmenu");
    else {
      document.querySelectorAll(".nav-submenu").forEach(function (value) {
        value.classList.remove("opensubmenu");
      });
      document
        .querySelector(".mega-menu-container")
        .classList.remove("opensubmenu");
      event.target.nextElementSibling.classList.add("opensubmenu");
    }
  };

  return (
    <div>
      <div className="main-navbar">
        <div id="mainnav">
          <div className="toggle-nav" onClick={openNav.bind(this)}>
            <i className="fa fa-bars sidebar-bar"></i>
          </div>
          <ul className="nav-menu" style={navClose}>
            <li className="back-btn" onClick={closeNav.bind(this)}>
              <div className="mobile-back text-right">
                <span>Back navbar</span>
                <i className="fa fa-angle-right pl-2" aria-hidden="true"></i>
              </div>
            </li>
            {MENUITEMS.map((menuItem, i) => {
              return (
                <li
                  key={i}
                >
                  <a className="nav-link">
                    {" "}
                    {t(menuItem.title)}
                    <span className="sub-arrow"></span>
                  </a>
                  {menuItem.children  && (
                    <ul className="nav-submenu">
                      {menuItem.children.map((childrenItem, index) => {
                        return (
                          <li
                            key={index}
                            className={`${childrenItem.children ? "sub-menu " : ""
                              }`}
                          >
                            {childrenItem.type === "sub" ? (
                              <a
                                href={null}
                                onClick={() => toggletNavActive(childrenItem)}
                              >
                                {childrenItem.title}
                                {childrenItem.tag === "new" ? (
                                  <span className="new-tag">new</span>
                                ) : (
                                  ""
                                )}
                                <i className="fa fa-angle-right pl-2"></i>
                              </a>
                            ) : (
                              ""
                            )}
                            {childrenItem.type === "link" ? (
                              <span>
                                {childrenItem.query ?
                                  <Link
                                    href={{ pathname: `${childrenItem.path}`, query: childrenItem.query }}
                                  >
                                    <a>
                                      {childrenItem.title}
                                      {childrenItem.tag === "new" ? (
                                        <span className="new-tag">new</span>
                                      ) : (
                                        ""
                                      )}
                                    </a>
                                  </Link>
                                  :
                                  <Link href={`${childrenItem.path}`}>
                                    <a>
                                      {childrenItem.title}
                                      {childrenItem.tag === "new" ? (
                                        <span className="new-tag">new</span>
                                      ) : (
                                        ""
                                      )}
                                    </a>
                                  </Link>
                                }
                              </span>
                            ) : (
                              ""
                            )}
                            {childrenItem.children ? (
                              <ul
                                className={`nav-sub-childmenu ${childrenItem.active ? "menu-open " : "active"
                                  }`}
                              >
                                {childrenItem.children.map(
                                  (childrenSubItem, key) => (
                                    <li key={key}>
                                      {childrenSubItem.type === "link" ? (
                                        <Link href={childrenSubItem.path}>
                                          <a className="sub-menu-title">
                                            {childrenSubItem.title}
                                            {childrenSubItem.tag === "new" ? (
                                              <span className="new-tag">
                                                new
                                              </span>
                                            ) : (
                                              ""
                                            )}
                                          </a>
                                        </Link>
                                      ) : (
                                        ""
                                      )}
                                    </li>
                                  )
                                )}
                              </ul>
                            ) : (
                              ""
                            )}
                          </li>
                        );
                      })}
                    </ul>)
                 }
                </li>
              );
            })}
          </ul>
        </div>
      </div>
    </div>
  );
};

export default NavBar;
