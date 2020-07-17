import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Dream about sharks?", "Have a notdog!"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
