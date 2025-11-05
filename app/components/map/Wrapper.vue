<template>
    <div class="border rounded-xl p-2">
        <LMap
            class="rounded-md"
            :zoom="6"
            :center="[51.1657, 10.4515]"
            :use-global-leaflet="false"
        >
            <LTileLayer
                url="https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}{r}.png"
                attribution="&copy; <a href='https://stadiamaps.com/'>Stadia Maps</a>"
                layer-type="base"
                name="Dark"
            />
        </LMap>
    </div>
</template>
