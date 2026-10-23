import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = ["wrapper", "sidebarToggleTooltip"];

  toggle(event) {
    event.preventDefault();

    const expandedClass = "sidebar--expanded";
    this.wrapperTarget.classList.toggle(expandedClass);

    const localStorageKey = "inventlorrySidebar";

    if (this.wrapperTarget.classList.contains(expandedClass)) {
      let oldSidebarToggleTooltip = document.querySelector(
        ".sidebar__toggle__tooltip__text--open",
      );
      let newSidebarTooltip = document.createElement("p");
      newSidebarTooltip.innerText = "Close sidebar";
      newSidebarTooltip.classList.add("sidebar__toggle__tooltip__text--close");
      this.sidebarToggleTooltipTarget.replaceChild(
        newSidebarTooltip,
        oldSidebarToggleTooltip,
      );
      window.localStorage.setItem(localStorageKey, "open");
    } else {
      let oldSidebarToggleTooltip = document.querySelector(
        ".sidebar__toggle__tooltip__text--close",
      );
      const newSidebarTooltip = document.createElement("p");
      newSidebarTooltip.innerText = "Open sidebar";
      newSidebarTooltip.classList.add("sidebar__toggle__tooltip__text--open");
      this.sidebarToggleTooltipTarget.replaceChild(
        newSidebarTooltip,
        oldSidebarToggleTooltip,
      );
      window.localStorage.setItem(localStorageKey, "closed");
    }
  }

  showSidebarToggleTooltip() {
    this.sidebarToggleTooltipTarget.togglePopover();
  }

  hideSidebarToggleTooltip() {
    this.sidebarToggleTooltipTarget.hidePopover();
  }
}
