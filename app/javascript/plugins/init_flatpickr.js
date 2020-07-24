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

const calculateDays = () => {
  const formElement = document.getElementById('booking_start_date');
  formElement.addEventListener('input', (e) => {
    console.log(e);
  })
  };

export { calculateDays };

//console.log(document.querySelector('.form-container').dataset.dates);

//ver: calculatedays, disable dates, booking validations
