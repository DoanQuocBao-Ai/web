import React, { useEffect, useState, useContext } from "react";
import { config } from "./config.json";

const ThemeSettings = () => {
  const [themeLayout, setThemeLayout] = useState(false);
  const [modal, setModal] = useState(false);
  const toggle = () => setModal(!modal);
  useEffect(() => {
    if (config.layout_version && config.layout_type) {
      document.body.className = `${config.layout_version}  ${config.layout_type}`;
    }

    if (localStorage.getItem("color")) {
      document.documentElement.style.setProperty(
        "--theme-deafult",
        localStorage.getItem("color")
      );
    }

    window.addEventListener("scroll", handleScroll);
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  const handleScroll = () => {
    if (process.browser) {
      if (document.documentElement.scrollTop > 600) {
        document.querySelector(".tap-top").style = "display: block";
      } else {
        document.querySelector(".tap-top").style = "display: none";
      }
    }
  };


  const changeThemeLayout = () => {
    setThemeLayout(!themeLayout);
  };

  if (themeLayout) {
    if (process.browser) {
      document.body.classList.add("dark");
      config.layout_version = "dark";
    }
  } else {
    if (process.browser) {
      document.body.classList.remove("dark");
      config.layout_version = "light";
    }
  }

  return (      
      <div className="sidebar-btn dark-light-btn">
        <div className="dark-light">
          <div
            className="theme-layout-version"
            onClick={() => changeThemeLayout()}
          >
            {themeLayout ? "Light" : "Dark"}
          </div>
        </div>
      </div>
  );
};

export default ThemeSettings;
