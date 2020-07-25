import flatpickr from "flatpickr";

flatpickr(".datepicker", {
    mode: "range",
    dateFormat: "Y-m-d",
    disable: [
    datesHash
    ]
});

var datesHash = document.querySelectorAll("#invalid-dates").forEach(element =>
  {
    //from: element.innerText.split(" - ")[0],
    //to: element.innerText.split(" - ")[1]
  });
