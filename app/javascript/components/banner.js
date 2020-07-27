import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.querySelector('#banner-typed-text')) {
    new Typed('#banner-typed-text', {
      strings: ["Dream about petting sharks? ^500", "Dream about a Notdog! ^2000"],
      typeSpeed: 80,
      backSpeed: 50,
      showCursor: true,
      smartBackspace: true,
      loop: true,
      showCursor: true,
      cursorChar: '|',
      autoInsertCss: true,
  });
  }
}





export { loadDynamicBannerText };
