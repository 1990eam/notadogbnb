import flatpickr from "flatpickr";

flatpickr(".datepicker", {
    mode: "range",
    dateFormat: "Y-m-d",
    disable: [
        {
            from: "2025-04-01",
            to: "2025-05-01"
        },
        {
            from: "2025-09-01",
            to: "2025-12-01"
        }
    ]
});

//console.log(document.querySelector('.form-container').dataset.dates);
