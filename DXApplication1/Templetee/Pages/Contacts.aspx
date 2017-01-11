<%@ Page Title="Contacts" Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.master" CodeBehind="Contacts.aspx.cs" Inherits="Templetee.Contacts" %>
<%@ Register Src="~/UserControls/AddCommentForm.ascx" TagPrefix="dx" TagName="AddCommentForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<div class="container-fluid">
    <div id="map" class="map row"></div>
</div>
<script src="http://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
<script src="http://openlayers.org/en/v3.18.2/build/ol.js"></script>
<script type="text/javascript">
(function(){
    var location = ol.proj.fromLonLat([-118.2554522, 34.1532212]);

    var map = new ol.Map({
        layers: [
            new ol.layer.Tile({
                source: new ol.source.OSM()
            }),
            getMarkerLayer()
        ],
        target: 'map',
        controls: ol.control.defaults(),
        interactions: ol.interaction.defaults({
            mouseWheelZoom: false
        }),
        view: new ol.View({
            center: location,
            zoom: 16
        })
    });

    function getMarkerLayer() {
        var iconFeature = new ol.Feature({
            geometry: new ol.geom.Point(location),
        });

        var iconStyle = new ol.style.Style({
            image: new ol.style.Circle({
                radius: 5,
                fill: new ol.style.Fill({
                    color: 'rgba(255,51,0,0.9)'
                })
            })
        });
        iconFeature.setStyle(iconStyle);

        var vectorSource = new ol.source.Vector({
            features: [iconFeature]
        });

        return new ol.layer.Vector({
            source: vectorSource
        });
    }
})();
</script>
<div class="container">
    <div class="row">
        <section class="col-md-8 marginTop40">
            <h3>Contact Form</h3>
            <p>Feel free to contact us</p>
            <dx:AddCommentForm runat="server"/>
            <hr class="marginTop40 visible-sm visible-xs"/>
        </section>
        <aside class="col-md-4 marginTop40">
            <h3>Address</h3>
            <p>505 N. Brand Blvd. 16th Floor Glendale CA 91203 USA</p>
            <h3>Customer Services</h3>
            <ul class="list-unstyled">
                <li><i class="glyphicon glyphicon-phone-alt"></i> + 1 (818) 844 3383</li>
                <li><i class="glyphicon glyphicon-envelope"></i> clientservices@devexpress.com</li>
            </ul>
            <h3>Enterprise Sales</h3>
            <ul class="list-unstyled">
                <li><i class="glyphicon glyphicon-phone-alt"></i> + 1 (818) 844 3395</li>
                <li><i class="glyphicon glyphicon-envelope"></i> corpsales@devexpress.com</li>
            </ul>
            <h3>Support</h3>
            <ul class="list-unstyled">
                <li><i class="glyphicon glyphicon-hand-right"></i> <a href="#">Support Center</a></li>
                <li><i class="glyphicon glyphicon-envelope"></i> support@devexpress.com</li>
            </ul>
        </aside>
    </div>
</div>
</asp:Content>