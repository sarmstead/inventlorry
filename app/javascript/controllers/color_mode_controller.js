import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="color-mode"
export default class extends Controller {
  toggle(event) {
    event.preventDefault();

    const { selection } = event.params;
    const localStorageKey = "inventlorryColorMode";
    window.localStorage.setItem(localStorageKey, selection);

    const selectedClass = "color-mode__switch--selected";
    const modeList = ["system-mode", "light-mode", "dark-mode"];
    const modeListLessSelection = modeList.filter((mode) => mode !== selection);
    modeListLessSelection.forEach((mode) => {
      document.documentElement.classList.remove(mode);
      document
        .querySelector(`[data-color-mode-selection-param='${mode}']`)
        .classList.remove(selectedClass);
    });

    document.documentElement.classList.add(selection);
    document
      .querySelector(`[data-color-mode-selection-param='${selection}']`)
      .classList.add(selectedClass);
  }
}
