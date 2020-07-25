import flatpickr from "flatpickr";

let array = [];

const bookingNew = document.querySelector(".booking-new")
  if (bookingNew) {
    document.querySelectorAll("#invalid-dates").forEach(element =>
      array[array.length] = ({
        from: element.innerText.split(" - ")[0],
        to: element.innerText.split(" - ")[1]
      })
      );
    flatpickr(".datepicker", {
      mode: "range",
      dateFormat: "Y-m-d",
      disable:
      array
    });
  }

