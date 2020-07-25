import flatpickr from "flatpickr";

let array = [];

var datesHash = document.querySelectorAll("#invalid-dates").forEach(element =>
  array[array.length] = ({
    from: element.innerText.split(" - ")[0],
    to: element.innerText.split(" - ")[1]
  })
  );

console.log(array);

flatpickr(".datepicker", {
    mode: "range",
    dateFormat: "Y-m-d",
    disable:
    array
});


