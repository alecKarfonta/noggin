FROM nginx:alpine

# Static Noggin game — single HTML file served at /synapse.html.
# /health is a synthetic 200 for k8s probes and the deploy verify step.
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY synapse.html /usr/share/nginx/html/synapse.html

EXPOSE 31019

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget -q -O /dev/null http://localhost:31019/health || exit 1

CMD ["nginx", "-g", "daemon off;"]
