import React, { useState, useEffect } from 'react';
import { Carousel } from 'react-bootstrap';
import './StylesPaginas.css';
import Navbar from '../Componentes/Navbar';
import { FaPhone, FaEnvelope } from 'react-icons/fa';
import Logotipo2 from '../Assets/Logotipo2.PNG';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

function Inicio() {
  const [categories, setCategories] = useState([]);
  const navigate = useNavigate();

  // Obtener categorías de la base de datos
  useEffect(() => {
    axios.get('http://localhost:5000/api/categories') // Endpoint para obtener las categorías
      .then(response => {
        setCategories(response.data);
      })
      .catch(error => {
        console.error('Error al obtener las categorías:', error);
      });
  }, []);

  const handleExploreProducts = () => {
    navigate('/productos');
  };

  // Imágenes fijas para el carrusel
  const images = [
    'imagen1.jpg', // Reemplaza con la ruta de tu imagen
    'imagen2.jpg', // Reemplaza con la ruta de tu imagen
    'imagen3.jpg', // Reemplaza con la ruta de tu imagen
    'imagen4.jpg', // Reemplaza con la ruta de tu imagen
    'imagen5.jpg', // Reemplaza con la ruta de tu imagen
    'imagen6.jpg'  // Reemplaza con la ruta de tu imagen
  ];

  // Agrupar imágenes en conjuntos de tres
  const groupedImages = [];
  for (let i = 0; i < images.length; i += 3) {
    groupedImages.push(images.slice(i, i + 3));
  }

  return (
    <>
      <Navbar />

      {/* Sección de Bienvenida */}
      <div className="welcome-section">
        <h1>Bienvenido a Carnespa</h1>
        <p>Descubre la calidad de nuestros embutidos, elaborados con los mejores ingredientes y métodos tradicionales.</p>
        <button className="explore-button" onClick={handleExploreProducts}>Explorar Productos</button>
      </div>

      {/* Sección de Categorías */}
      <div className="categories-section">
        <h1>Categorías en las que somos expertos</h1>
        <p>Ofrecemos una amplia variedad de embutidos, desde chorizos ahumados hasta jamones curados, todos elaborados con pasión y dedicación.</p>
      </div>

      {/* CAROUSEL dinámico con imágenes fijas */}
      <Carousel className="custom-carousel" controls={true} indicators={true}>
        {groupedImages.map((group, index) => (
          <Carousel.Item key={index}>
            <div className="carousel-container">
              {group.map((image, idx) => (
                <img
                  key={idx}
                  className="d-block carousel-image"
                  src={`http://localhost:5001/uploads/${image}`} // Asegúrate de que la ruta sea correcta
                  alt={`Imagen ${idx + 1}`}
                />
              ))}
            </div>
          </Carousel.Item>
        ))}
      </Carousel>

      {/* INFORMACIÓN DE EMPRESA */}
      <div className="info-container">
        <h1>¿Quiénes Somos?</h1>
        <div className="info-content">
          <img className="info-image" src={Logotipo2} alt="Carnespa" />
          <p className="info-text">
            Carnespa es una empresa dedicada a la producción de embutidos de alta calidad,
            utilizando los mejores ingredientes y métodos tradicionales para ofrecer productos
            deliciosos y frescos a nuestros clientes. Nos comprometemos a brindar excelencia
            en cada bocado.
          </p>
        </div>
      </div>

      {/* Sección de Contacto */}
      <div className="contact-section">
        <h2>Contáctanos</h2>
        <p><FaEnvelope /> SERVICIOALCLIENTE@CARNESPA.COM</p>
        <p><FaEnvelope /> RECEPCION@CARNESPA.COM</p>
        <p><FaPhone /> PBX 2289-4542</p>
      </div>
    </>
  );
}

export default Inicio;
