import flatpickr from "flatpickr";

let array = [];

document.querySelectorAll("#invalid-dates").forEach(element =>
  array[array.length] = ({
    from: element.innerText.split(" - ")[0],
    to: element.innerText.split(" - ")[1]
  })
  );

if (document.querySelector("#invalid-dates")) {
  if (array.length > 0) {
    flatpickr(".datepicker", {
        mode: "range",
        dateFormat: "Y-m-d",
        disable:
        array
    });
  } else {
    flatpickr(".datepicker", {
        mode: "range",
        dateFormat: "Y-m-d"
    });
  }
}


