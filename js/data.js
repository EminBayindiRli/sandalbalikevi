/* Menü ve ayar verisini getirir.
   Sıra: Supabase → son başarılı kopya (bu telefonda) → /data/menu.json */
(function(){
  const CACHE="sandal-data-v1";
  const DEFAULTS={whatsapp:"905324150690",phone:"+902322344418",
    review_url:"https://search.google.com/local/writereview?placeid=ChIJCYB-InPquxQRvl89V1j0yZg",
    instagram:"https://www.instagram.com/sandalbalikevi/"};
  const ALLERGENS={
    gluten:{tr:"Gluten",en:"Gluten"}, kabuklu:{tr:"Kabuklu deniz ürünü",en:"Crustaceans"},
    yumurta:{tr:"Yumurta",en:"Egg"}, balik:{tr:"Balık",en:"Fish"}, yerfistigi:{tr:"Yer fıstığı",en:"Peanut"},
    soya:{tr:"Soya",en:"Soy"}, sut:{tr:"Süt",en:"Milk"}, kuruyemis:{tr:"Sert kabuklu yemiş",en:"Tree nuts"},
    kereviz:{tr:"Kereviz",en:"Celery"}, hardal:{tr:"Hardal",en:"Mustard"}, susam:{tr:"Susam",en:"Sesame"},
    sulfit:{tr:"Sülfit",en:"Sulphites"}, acibakla:{tr:"Acı bakla",en:"Lupin"}, yumusakca:{tr:"Yumuşakça",en:"Molluscs"}
  };
  const THEMES={
    aub:{bg:"#5A2448",fg:"#FFF3E6",ac:"#F2B035",sun:"#74335F",name:"Patlıcan moru"},
    saf:{bg:"#F2B035",fg:"#102A4C",ac:"#E85A3C",sun:"#F7C766",name:"Safran"},
    sea:{bg:"#2F5E4E",fg:"#FFF3E6",ac:"#F2B035",sun:"#3D7462",name:"Deniz yeşili"},
    coral:{bg:"#E85A3C",fg:"#FFF3E6",ac:"#F2B035",sun:"#EF7457",name:"Mercan"},
    ink:{bg:"#102A4C",fg:"#FFF3E6",ac:"#F2B035",sun:"#1E3E68",name:"Lacivert"}
  };
  function cfg(){const c=window.SANDAL_CONFIG||{};return c.url&&c.key?c:null}
  function headers(c){const h={apikey:c.key};if(!/^sb_/.test(c.key))h.Authorization="Bearer "+c.key;return h}
  async function rest(c,path,ms){
    const ctl=new AbortController();const t=setTimeout(()=>ctl.abort(),ms||7000);
    try{const r=await fetch(c.url.replace(/\/$/,"")+"/rest/v1/"+path,{headers:headers(c),signal:ctl.signal,cache:"no-store"});
      if(!r.ok) throw new Error("HTTP "+r.status); return await r.json();}
    finally{clearTimeout(t)}
  }
  function norm(d){
    d.categories=(d.categories||[]).filter(c=>c.visible!==false).sort((a,b)=>(a.sort||0)-(b.sort||0));
    d.items=(d.items||[]).sort((a,b)=>(a.sort||0)-(b.sort||0));
    d.settings=Object.assign({},DEFAULTS,...Object.entries(d.settings||{}).filter(([k,v])=>v!==null&&v!=="").map(([k,v])=>({[k]:v})));
    return d;
  }
  async function load(){
    const c=cfg();
    if(c){
      try{
        const [categories,items,settings]=await Promise.all([
          rest(c,"categories?select=*&order=sort.asc"),
          rest(c,"items?select=*&order=sort.asc"),
          rest(c,"settings?select=*&id=eq.1")
        ]);
        const d={categories,items,settings:settings[0]||{},source:"live"};
        try{localStorage.setItem(CACHE,JSON.stringify(d))}catch(e){}
        return norm(d);
      }catch(e){ console.warn("Canlı veri alınamadı:",e.message) }
      try{const s=localStorage.getItem(CACHE); if(s){const d=JSON.parse(s);d.source="cache";return norm(d)}}catch(e){}
    }
    const r=await fetch("/data/menu.json",{cache:"no-cache"}); const d=await r.json(); d.source="file"; return norm(d);
  }
  function waLink(num,text){return "https://wa.me/"+String(num||DEFAULTS.whatsapp).replace(/\D/g,"")+(text?"?text="+encodeURIComponent(text):"")}
  window.SANDAL={load,ALLERGENS,THEMES,DEFAULTS,waLink,cfg};
})();
